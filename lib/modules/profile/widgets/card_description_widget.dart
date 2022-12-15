import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:loviser/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loviser/modules/profile/pages/about_me_page.dart';
import '../../../providers/page/message_page/card_profile_provider.dart';

class CardDescriptionWidget extends StatelessWidget {
  final bool isMe;
  final User? user;
  const CardDescriptionWidget({
    super.key,
    this.isMe = false,
    required this.user,
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
                    'assets/images/ic_about_me.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  'Giới thiệu',
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
                                builder: (_) => AboutMePage(
                                  user: user,
                                ),
                              ),
                            ),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                'assets/images/ic_edit.png',
                                fit: BoxFit.cover,
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
            Text(
              '${user?.about}',
              style: TextStyle(
                color: Color.fromRGBO(82, 75, 107, 1),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
