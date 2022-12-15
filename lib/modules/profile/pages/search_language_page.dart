import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loviser/modules/profile/models/language.dart';
import 'package:loviser/modules/profile/pages/add_language_page.dart';
import 'package:loviser/modules/profile/widgets/item_language.dart';

class SearchLanguagePage extends StatefulWidget {
  const SearchLanguagePage({super.key});

  @override
  State<SearchLanguagePage> createState() => _SearchLanguagePageState();
}

class _SearchLanguagePageState extends State<SearchLanguagePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Language> languages = [
    Language(
        nameCountry: 'VietNamese', imgCountry: 'assets/images/vietnam.png'),
    Language(nameCountry: 'English', imgCountry: 'assets/images/english.png'),
    Language(nameCountry: 'Italy', imgCountry: 'assets/images/italian.png'),
    Language(nameCountry: 'French', imgCountry: 'assets/images/french.png'),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 239, 239),
        body: SafeArea(
          child: SingleChildScrollView(
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
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Thêm ngôn ngữ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          size: 26,
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: 'Nhập ngôn ngữ',
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    runSpacing: 10,
                    children: List.generate(
                      languages.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => AddLanguagePage(
                                language: languages[index],
                              ),
                            ),
                          );
                          // setState(() {
                          //   languages[index].isPicked
                          //       ? languages[index].isPicked = false
                          //       : languages[index].isPicked = true;
                          // });
                        },
                        child: ItemLanguage(
                          language: languages[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
