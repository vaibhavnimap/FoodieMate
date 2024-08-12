import 'package:flutter/material.dart';

import '../../data/utils/constantcolors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color background;
  final Color textColor;

  const Button({
    super.key,
    required this.text,
    required this.onTap,
    this.background = ConstantColors.yellow,
    this.textColor = ConstantColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            )),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
