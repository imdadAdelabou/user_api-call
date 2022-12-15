import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loviser/modules/profile/models/skill.dart';
import 'package:loviser/modules/profile/widgets/button_save_widget.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  final TextEditingController _controller = TextEditingController();

  List<Skill> skills = [
    Skill(nameSkill: 'Thất tình'),
    Skill(nameSkill: 'Tán tỉnh'),
    Skill(nameSkill: 'Duy trì'),
    Skill(nameSkill: 'Cảm xúc'),
    Skill(nameSkill: 'Buồn'),
    Skill(nameSkill: "Khác"),
  ];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
                  'Thêm kỹ năng',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                child: Wrap(
                  runSpacing: 15,
                  children: List.generate(
                    skills.length + 1,
                    (index) {
                      return index < skills.length
                          ? Container(
                              padding: const EdgeInsets.all(10),
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
                                      'assets/images/sad.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      skills[index].nameSkill,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.red,
                                    value: skills[index].isPicked,
                                    shape: const CircleBorder(),
                                    onChanged: (bool? value) {
                                      setState(
                                        () {
                                          skills[index].isPicked = value!;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              children: [
                                Container(
                                  width: 1,
                                  height: 59,
                                  color: const Color(0xFF356899),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF356899),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF356899),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      hintText: 'Nhập kĩ năng của bạn vào đây',
                                    ),
                                    controller: _controller,
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                child: ButtonSaveWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
