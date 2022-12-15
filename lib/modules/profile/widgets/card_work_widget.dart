import 'package:flutter/material.dart';
import 'package:loviser/models/user_work.dart';
import 'package:loviser/modules/profile/pages/work_experience_page.dart';
import '../../../providers/page/message_page/card_profile_provider.dart';

class CardWorkWidget extends StatelessWidget {
  final bool isMe;
  final UserWork userWork;

  const CardWorkWidget({
    super.key,
    this.isMe = false,
    required this.userWork,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 25,
          left: 25,
          bottom: 15,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'assets/images/ic_work_experience.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  'Công việc',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isMe
                    ? Expanded(
                        child: Align(
                          alignment: const Alignment(1, 0),
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const WorkExperiencePage(),
                              ),
                            ),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(255, 158, 135, 0.2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromRGBO(236, 28, 36, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              color: const Color.fromRGBO(222, 225, 231, 1),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Text(
                  userWork.company,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isMe
                    ? Expanded(
                        child: Align(
                          alignment: const Alignment(1, 0),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              'assets/images/ic_edit.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userWork.position,
                  style: TextStyle(
                    color: Color.fromRGBO(82, 75, 107, 1),
                    fontSize: 16,
                  ),
                ),
                Text(
                  userWork.workStartDate,
                  style: TextStyle(
                    color: Color.fromRGBO(82, 75, 107, 1),
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
