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
          "Đăng bài miễn phí",
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
              "Tiêu đề",
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
                  hintText: 'Ghi ngắn gọn vấn đề tình cảm mà bạn đang gặp phải',
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
              "Bạn đang gặp vấn đề gì?",
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
                      'Hãy viết vấn đề bạn đang gặp phải tại đây, cộng đồng người dùng LOVISER sẽ giúp bạn giải quyết.',
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
                          "Đăng vấn đề",
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
