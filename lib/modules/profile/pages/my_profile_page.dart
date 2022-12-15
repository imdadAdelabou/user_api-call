import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:loviser/modules/profile/widgets/card_description_widget.dart';
import 'package:loviser/modules/profile/widgets/card_language_widget.dart';
import 'package:loviser/modules/profile/widgets/card_profile_widget.dart';
import 'package:loviser/modules/profile/widgets/card_resume_widget.dart';
import 'package:loviser/modules/profile/widgets/card_skill_widget.dart';
import 'package:loviser/modules/profile/widgets/card_study_widget.dart';
import 'package:loviser/modules/profile/widgets/card_work_widget.dart';
import 'package:provider/provider.dart';
import '../../../providers/page/message_page/card_profile_provider.dart';
import '../../../providers/page/message_page/message_page_provider.dart';

class MyProfilePage extends StatefulWidget {
  final bool isMe;
  const MyProfilePage({
    super.key,
    this.isMe = false,
  });

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late String current_user_id;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    current_user_id = Provider.of<MessagePageProvider>(context, listen: false)
        .current_user_id;
    Provider.of<CardProfileProvider>(context).fetchCurrentUser(current_user_id);
    //print(login);
  }

  @override
  Widget build(BuildContext context) {
    final userCurrent = Provider.of<CardProfileProvider>(context).user;
    final size = MediaQuery.of(context).size;
    const double sizeBackground = 300;
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC).withOpacity(0.98),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 190,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: sizeBackground,
                    width: double.infinity,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1660029865414-4a8f3c6ccc0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: sizeBackground - 380 / 2,
                    child:
                        CardProfileWidget(isMe: widget.isMe, user: userCurrent),
                  ),
                  Positioned(
                    top: 50,
                    left: 7,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CardWorkWidget(
                    isMe: widget.isMe,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CardDescriptionWidget(
                    isMe: widget.isMe,
                    user: userCurrent,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CardStudyWidget(isMe: widget.isMe),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CardResumeWidget(isMe: widget.isMe),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CardSkillWidget(isMe: widget.isMe),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CardLanguageWidget(isMe: widget.isMe),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
