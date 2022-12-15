import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loviser/modules/post/free_post/widgets/image_upload_item.dart';
import 'package:loviser/modules/post/free_post/widgets/upload_group_state_ctl.dart';
import 'package:loviser/modules/post/free_post/widgets/upload_group_value.dart';
import 'package:loviser/modules/post/free_post/widgets/upload_item.dart';
import 'package:uuid/uuid.dart';

class ImageUploadGroup extends StatefulWidget {
  final int maxImage;
  final List<ImageUploadItem> listImages;
  final String folder;
  final bool isFullGrid;
  final Function(UploadGroupValue) onValueChanged;
  final Function() pickImageDone;

  const ImageUploadGroup({
    super.key,
    this.maxImage = 5,
    this.isFullGrid = true,
    required this.listImages,
    this.folder = "post",
    required this.onValueChanged,
    required this.pickImageDone,
  });

  @override
  State<ImageUploadGroup> createState() => _ImageUploadGroupState();
}

class _ImageUploadGroupState extends State<ImageUploadGroup> {
  final controller = UploadGroupStateController();
  List<ImageUploadItem> _lstImageParam = <ImageUploadItem>[];

  int maxImageInRow = 3;
  int spacingItem = 8;

  int? _imgWidth;
  int? _imgHeight;
  double aspectRatio = 0.75;

  int get maxImage => widget.maxImage;
  int get realMaxImage =>
      maxImage -
      _lstImageParam.where((element) => element.asset == null).length;

  bool get isReady =>
      _lstImageParam.where((element) => element.id == "").isEmpty;

  List<File> get _selectedAssets => _lstImageParam
      .where((element) => element.asset != null)
      .map((e) => e.asset!)
      .toList();

  @override
  void initState() {
    super.initState();

    print('no');
    if (widget.listImages.isNotEmpty) {
      print('has');

      _lstImageParam = widget.listImages;
    }

    controller.addListener(_didChangeValue);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.removeListener(_didChangeValue);
  }

  void _didChangeValue() {
    widget.onValueChanged(controller.value);
  }

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    const marginHorizontal = 16;

    _imgWidth = ((screenWith -
                (marginHorizontal * 2) -
                (spacingItem * (maxImageInRow - 1))) ~/
            maxImageInRow)
        .toInt();

    _imgHeight = (_imgWidth! ~/ aspectRatio).toInt();

    return buildGridView();
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: maxImageInRow,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: aspectRatio,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.isFullGrid
          ? maxImage
          : min(_lstImageParam.length + 1, maxImage),
      itemBuilder: (context, index) {
        if (widget.isFullGrid) {
          if (index >= _lstImageParam.length) {
            return buildItemImage(image: _lstImageParam[index], index: index);
          } else {
            return buildItemImage(image: _lstImageParam[index], index: index);
          }
        } else {
          if (index < _lstImageParam.length) {
            return buildItemImage(image: _lstImageParam[index], index: index);
          }
          if (index == _lstImageParam.length) return buildItemAddImage(index);
          return Container();
        }
      },
    );
  }

  Widget buildItemImage({required ImageUploadItem image, required int index}) {
    print("build $index image ${image.assetName}");
    return Container(
      //padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: UploadItem(
          controller: image.controller!,
          onDelete: () => {removeImage(index)},
          showDeleteButton: true,
          placeholder: image.placeHolder,
        ),
      ),
    );
  }

  Widget buildItemAddImage(index) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.grey,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () async {
          await chooseAndUploadImage();
        },
        child: Stack(
          fit: StackFit.expand,
          children: const [
            Positioned(
              top: 5.0,
              right: 5.0,
              child: Material(
                elevation: 3.0,
                shape: CircleBorder(),
                child: Icon(
                  Icons.add_circle,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<File> resultList = <File>[];

  chooseAndUploadImage() async {
    List<File>? resultListTmp = <File>[];

    var localListImg = <ImageUploadItem>[];

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (result != null) {
      resultListTmp = result.paths.map((path) => File(path!)).toList();
    }

    if (resultListTmp.isNotEmpty) {
      resultList.addAll(resultListTmp);
    }

    if (resultList.isEmpty) return;

    for (int i = 0; i < resultList.length; i++) {
      var r = resultList[i];

      String? imageName = r.path;

      if (_lstImageParam.isNotEmpty) {
        var foundIdx = (_lstImageParam.indexWhere((x) => x.name == imageName));

        if (foundIdx != -1) {
          localListImg.add(_lstImageParam[foundIdx]);
          continue;
        }
      }

      var placeHolder = Image.file(
        r,
        width: _imgWidth!.ceil() * 2,
        height: _imgHeight!.ceil() * 2,
        fit: BoxFit.cover,
      );

      ImageUploadItem imageParam = ImageUploadItem(r, imageName, placeHolder);
      localListImg.add(imageParam);

      uploadImage(imageParam);
    }
    _lstImageParam = [
      ..._lstImageParam.where((e) => e.asset == null).toList(),
      ...localListImg
    ];
    // update controller value
    controller.value = controller.value.withValue(_lstImageParam);

    if (!mounted) return;

    if (resultList.isNotEmpty) {
      setState(() {});

      final copyList = _lstImageParam.toList();

      for (int i = 0; i < copyList.length; i++) {
        if (i >= _lstImageParam.length) continue;
        if (_lstImageParam[i].state == "init") uploadImage(_lstImageParam[i]);
      }
    }
  }

  void uploadImage(ImageUploadItem item) async {
    try {
      final cloudinary = CloudinaryPublic('dpx4x5tfh', 'm1gthj2u');

      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          item.name!,
          folder: 'free-post',
        ),
        onProgress: ((sent, total) {
          if (sent == total) {
            item.controller!.progress = 0.999;
          } else {
            item.controller!.progress = sent / total;
          }
        }),
      );
      item.id = response.secureUrl;
      item.controller!.progress = 1.0; // done

      // Update controller value
      controller.value = controller.value.withValue(_lstImageParam);
    } catch (e) {
      print(e);
      item.setError(e.toString()); // not need right now

      final idx = _lstImageParam.indexOf(item);
      removeImage(idx);
    }
  }

  void removeImage(index) {
    final imgUplItem = _lstImageParam[index];
    imgUplItem.cancelToken!.cancel();

    _lstImageParam.removeAt(index);
    // commit changes
    setState(() {});

    controller.value = controller.value.withValue(_lstImageParam);
  }
}
