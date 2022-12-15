import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loviser/utils/utils.dart';

class ItemAddImage extends StatefulWidget {
  final int index;
  const ItemAddImage({
    super.key,
    required this.index,
  });

  @override
  State<ItemAddImage> createState() => _ItemAddImageState();
}

class _ItemAddImageState extends State<ItemAddImage> {
  Uint8List? _image;

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectImage();
      },
      child: SizedBox(
        width: 80,
        height: 80,
        child: DottedBorder(
          color: Colors.red,
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          padding: const EdgeInsets.all(0),
          child: const Center(
            child: Icon(
              Icons.camera_alt,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
