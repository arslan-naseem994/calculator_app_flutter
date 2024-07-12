import 'package:calculator/utils/textstyles.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      this.color = Colors.grey,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: InkWell(
        onTap: onPress,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Text(
              title,
              style: buttontext,
            ),
          ),
        ),
      ),
    );
  }
}
