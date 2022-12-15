import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:loviser/models/user.dart';
import 'package:loviser/modules/profile/pages/my_profile_page.dart';
import 'package:loviser/modules/profile/widgets/button_save_widget.dart';
import 'package:loviser/providers/page/message_page/card_profile_provider.dart';
import 'package:loviser/providers/page/message_page/message_page_provider.dart';
import 'package:provider/provider.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key, required this.user});
  final User? user;
  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  final TextEditingController _descriptionController = TextEditingController();
  late bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _descriptionController.text = '${widget.user?.about}';
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                'Giới thiệu',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Kể cho tôi nghe về bạn.',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(230, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      primary: const Color(0xFFEC1C24),
                      onPrimary: Colors.white),
                  child: FittedBox(
                    child: _isLoading
                        // ? Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: <Widget>[
                        //       SizedBox(
                        //         height: 20,
                        //         width: 20,
                        //         child: CircularProgressIndicator(
                        //           color: Colors.white,
                        //           strokeWidth: 4,
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 20,
                        //       ),
                        //       const Text(
                        //         'Đang lưu...',
                        //         style: TextStyle(
                        //           fontFamily: 'AvertaStdCY-Semibold',
                        //           //height: 26,
                        //           color: Colors.white,
                        //           fontSize: 16,
                        //         ),
                        //       ),
                        //     ],
                        //   )
                        ? Image.asset(
                            'assets/images/load.gif',
                            height: 50,
                          )
                        : const Text(
                            'Lưu',
                            style: TextStyle(
                              fontFamily: 'AvertaStdCY-Semibold',
                              //height: 26,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                  ),
                  onPressed: (() async {
                    setState(() {
                      _isLoading = true;
                    });
                    String userID =
                        Provider.of<MessagePageProvider>(context, listen: false)
                            .current_user_id;
                    await Provider.of<CardProfileProvider>(context,
                            listen: false)
                        .updatecurrentuser(userID, _descriptionController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyProfilePage(
                            isMe: true,
                          ),
                        ));
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
