import 'package:flutter/material.dart';
import 'package:loviser/modules/profile/pages/education_page.dart';

class CardStudyWidget extends StatelessWidget {
  final bool isMe;
  const CardStudyWidget({
    super.key,
    this.isMe = false,
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
                    'assets/images/ic_education.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  'Học vấn',
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
                                builder: (_) => const EducationPage(),
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
                const Text(
                  'Information Technology',
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
              children: const [
                Expanded(
                  child: Text(
                    'Trường Đại học Công nghệ Thông tin - ĐHQG TP.HCM',
                    style: TextStyle(
                      color: Color.fromRGBO(82, 75, 107, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  '1/2015 - 5/2015',
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
