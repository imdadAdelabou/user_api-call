import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:loviser/config/config.dart';
import 'package:loviser/modules/post/free_post/models/fee_post.dart';
import 'package:loviser/modules/post/free_post/widgets/image_upload_group.dart';
import 'package:loviser/modules/post/free_post/widgets/image_upload_item.dart';
import 'package:loviser/modules/post/free_post/widgets/upload_group_value.dart';

class CreateFreePost extends StatefulWidget {
  const CreateFreePost({super.key});

  @override
  State<CreateFreePost> createState() => _CreateFreePostState();
}

class _CreateFreePostState extends State<CreateFreePost> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descriptionController.dispose();
    _titleController.dispose();
  }

  UploadGroupValue _currentUploadValue =
      const UploadGroupValue(<ImageUploadItem>[]);

  void createFeePost(String title, String description) async {
    setState(() {
      isLoading = true;
    });

    FeePost feePost = FeePost(
      userId: '634e8757170ca531fbfface0',
      title: title,
      description: description,
      images: _currentUploadValue.uploadedIds,
    );
    print(feePost.title);
    print(feePost.description);
    await post(
      Uri.parse('$urlCreateFreePost${feePost.userId}'),
      body: feePost.toJson(),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_currentUploadValue.value.length);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: const Text(
          "????ng b??i mi???n ph??",
          style: TextStyle(
            color: Color(0xFF000000),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Ti??u ?????",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: _titleController,
                maxLines: 2,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  border: InputBorder.none,
                  hintText: 'Ghi ng???n g???n v???n ????? t??nh c???m m?? b???n ??ang g???p ph???i',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "B???n ??ang g???p v???n ????? g???",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  border: InputBorder.none,
                  hintText:
                      'H??y vi???t v???n ????? b???n ??ang g???p ph???i t???i ????y, c???ng ?????ng ng?????i d??ng LOVISER s??? gi??p b???n gi???i quy???t.',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ImageUploadGroup(
                isFullGrid: false,
                onValueChanged: (UploadGroupValue value) {
                  setState(() {
                    _currentUploadValue = value;
                  });
                },
                pickImageDone: () {
                  FocusScope.of(context).unfocus();
                },
                listImages: [],
              ),
            ),
            SafeArea(
              child: SizedBox(
                height: 50,
                width: 315,
                child: ElevatedButton(
                  onPressed: () => createFeePost(
                    _titleController.text,
                    _descriptionController.text,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "????ng v???n ?????",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
