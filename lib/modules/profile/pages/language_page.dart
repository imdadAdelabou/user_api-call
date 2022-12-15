import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loviser/modules/profile/models/language.dart';
import 'package:loviser/modules/profile/pages/search_language_page.dart';
import 'package:loviser/modules/profile/widgets/button_save_widget.dart';

class LanguagePage extends StatefulWidget {
  final List<Language> languages;

  const LanguagePage({
    super.key,
    required this.languages,
  });

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ngôn ngữ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SearchLanguagePage(),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Thêm',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xFF7551FF),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF3F13E4).withOpacity(0.2),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Color(0xFF3F13E4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                runSpacing: 10,
                children: List.generate(
                  widget.languages.length,
                  (index) => Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            widget.languages[index].imgCountry,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            widget.languages[index].nameCountry,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            bool? value = await showModalBottomSheet<bool>(
                              isDismissible: false,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 30,
                                    top: 30,
                                    bottom: 20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Xoá ngôn ngữ ${widget.languages[index].nameCountry}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Bạn có muốn xoá ngôn ngữ ${widget.languages[index].nameCountry} không ?',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            Colors.red,
                                          ),
                                        ),
                                        child: const Center(
                                            child: Text('CHẮC CHẮN')),
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              const Color(0xFFF5F7FA),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'HOÀN TÁC',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );

                            if (value! == true) {
                              setState(() {
                                widget.languages.removeAt(index);
                              });
                            }
                          },
                          icon: Image.asset('assets/images/delete_account.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              child: ButtonSaveWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
