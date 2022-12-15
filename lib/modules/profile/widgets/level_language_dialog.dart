import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loviser/modules/profile/widgets/button_save_widget.dart';
import 'package:loviser/modules/profile/widgets/item_level.dart';

enum Level {
  level0,
  level1,
  level2,
  level3,
  level4,
  level5,
  level6,
  level7,
  level8,
  level9,
  level10,
}

class LevelLanguageDialog extends StatefulWidget {
  const LevelLanguageDialog({super.key});

  @override
  State<LevelLanguageDialog> createState() => _LevelLanguageDialogState();
}

class _LevelLanguageDialogState extends State<LevelLanguageDialog> {
  Level _level = Level.level0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ItemLevel(
              level: Level.level0,
              name: 'Level 0',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level1,
              name: 'Level 1',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level2,
              name: 'Level 2',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level3,
              name: 'Level 3',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level4,
              name: 'Level 4',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level5,
              name: 'Level 5',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level6,
              name: 'Level 6',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level7,
              name: 'Level 7',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level8,
              name: 'Level 8',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level9,
              name: 'Level 9',
              group: _level,
              onChanged: onChanged,
            ),
            ItemLevel(
              level: Level.level10,
              name: 'Level 10',
              group: _level,
              onChanged: onChanged,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => Navigator.pop(context, _level),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Xong',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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

  void onChanged(Level? level) {
    setState(() {
      _level = level!;
    });
  }
}
