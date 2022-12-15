import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loviser/modules/profile/widgets/level_language_dialog.dart';

class ItemLevel extends StatelessWidget {
  final Level level;
  final Level group;
  final String name;
  final Function(Level?) onChanged;

  const ItemLevel({
    super.key,
    required this.level,
    required this.name,
    required this.onChanged,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        Radio(
          value: level,
          groupValue: group,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
