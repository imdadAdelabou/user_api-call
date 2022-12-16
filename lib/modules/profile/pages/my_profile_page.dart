import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:loviser/config/config.dart';
import 'package:loviser/models/user_work.dart';
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
  final _dio = Dio();

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

  Future<List<UserWork>> getAllUserWork(String userId) async {
    List<UserWork> works = [];

    try {
      var result = await _dio.get("$baseUrl/auth/getUser/$userId");

      Map<String, dynamic> data = result.data as Map<String, dynamic>;
      print(data["message"]["works"]);
      var worksServer = data["message"]["works"];

      for (int i = 0; i < worksServer.length; i++) {
        works.add(UserWork.toUserWork(worksServer[i] as Map<String, dynamic>));
      }

      return works;
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final userCurrent = context.watch<CardProfileProvider>().user;
    final size = MediaQuery.of(context).size;
    const double sizeBackground = 300;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC).withOpacity(0.98),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
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
                      child: CardProfileWidget(
                          isMe: widget.isMe, user: userCurrent),
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
                    child: FutureBuilder<List<UserWork>>(
                      future: getAllUserWork(
                        context.watch<MessagePageProvider>().current_user_id,
                      ),
                      builder: (context, snapshots) {
                        if (snapshots.hasError) {
                          return const Text("An error occurs");
                        }
                        if (snapshots.data != null) {
                          if (snapshots.data!.isEmpty) {
                            return const Text("No works history to show");
                          } else {
                            List<UserWork> works = snapshots.data!;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: works.length,
                              itemBuilder: (context, index) {
                                return CardWorkWidget(
                                  isMe: widget.isMe,
                                  userWork: works[index],
                                );
                              },
                            );
                          }
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
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
      ),
    );
  }
}
