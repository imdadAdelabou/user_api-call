import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loviser/modules/profile/models/language.dart';

class ItemLanguage extends StatelessWidget {
  final Language language;

  const ItemLanguage({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: language.isPicked ? const Color(0xFFA993FF) : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              language.imgCountry,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              language.nameCountry,
              style: TextStyle(
                color: language.isPicked ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          language.isPicked
              ? Image.asset(
                  'assets/images/tick.png',
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
