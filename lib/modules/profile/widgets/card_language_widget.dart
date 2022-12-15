import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loviser/modules/profile/models/language.dart';
import 'package:loviser/modules/profile/pages/language_page.dart';

class CardLanguageWidget extends StatelessWidget {
  final bool isMe;
  const CardLanguageWidget({
    super.key,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Language> languages = [
      Language(
        nameCountry: 'VietNamese',
        imgCountry: 'assets/images/vietnam.png',
        isPicked: true,
        isMain: true,
      ),
      Language(
          nameCountry: 'English',
          imgCountry: 'assets/images/english.png',
          isPicked: true),
      Language(
          nameCountry: 'Italy',
          imgCountry: 'assets/images/italian.png',
          isPicked: true),
      Language(
          nameCountry: 'French',
          imgCountry: 'assets/images/french.png',
          isPicked: true),
    ];
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
                    'assets/images/ic_language.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  'Ngôn ngữ',
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
                                builder: (_) => LanguagePage(
                                  languages: languages,
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
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  languages.length,
                  (index) => Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF5F5F6),
                    ),
                    child: Text(
                      languages[index].nameCountry,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
