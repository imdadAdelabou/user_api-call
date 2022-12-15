import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loviser/modules/profile/models/language.dart';
import 'package:loviser/modules/profile/widgets/button_save_widget.dart';
import 'package:loviser/modules/profile/widgets/level_language_dialog.dart';

class AddLanguagePage extends StatefulWidget {
  final Language language;

  const AddLanguagePage({
    super.key,
    required this.language,
  });

  @override
  State<AddLanguagePage> createState() => _AddLanguagePageState();
}

class _AddLanguagePageState extends State<AddLanguagePage> {
  final TextEditingController _speakController = TextEditingController();
  final TextEditingController _writeController = TextEditingController();

  @override
  void dispose() {
    _speakController.dispose();
    _writeController.dispose();
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ngôn ngữ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              widget.language.imgCountry,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.language.nameCountry,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xFFDEE1E7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ngôn ngữ chính',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Radio<bool>(
                          toggleable: true,
                          activeColor: Colors.red,
                          value: widget.language.isMain,
                          groupValue: true,
                          onChanged: (isMain) {
                            setState(
                              () {
                                widget.language.isMain =
                                    !widget.language.isMain;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nói',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextField(
                      controller: _speakController,
                      onTap: () async {
                        Level level = await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => const LevelLanguageDialog(),
                        );
                        setState(() {
                          _speakController.text = convertLevel(level);
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Điền mức độ thông thạo của bạn',
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFDEE1E7),
                    ),
                    const Text(
                      'Viết',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextField(
                      controller: _writeController,
                      onTap: () async {
                        Level level = await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => const LevelLanguageDialog(),
                        );
                        setState(() {
                          _writeController.text = convertLevel(level);
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Điền mức độ thông thạo của bạn'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Mức độ thông thạo: 0: Kém, 10: Rất tốt',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFAAA6B9),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                child: ButtonSaveWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String convertLevel(Level level) {
    String levelName = '';
    switch (level) {
      case Level.level0:
        levelName = 'Level 0';
        break;
      case Level.level1:
        levelName = 'Level 1';
        break;
      case Level.level2:
        levelName = 'Level 2';
        break;
      case Level.level3:
        levelName = 'Level 3';
        break;
      case Level.level4:
        levelName = 'Level 4';
        break;
      case Level.level5:
        levelName = 'Level 5';
        break;
      case Level.level6:
        levelName = 'Level 6';
        break;
      case Level.level7:
        levelName = 'Level 7';
        break;
      case Level.level8:
        levelName = 'Level 8';
        break;
      case Level.level9:
        levelName = 'Level 9';
        break;
      case Level.level10:
        levelName = 'Level 10';
        break;
    }

    return levelName;
  }
}
