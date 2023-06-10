import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function(String value) onTap;
  final Color color;
  final Color textColor;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.transparent,
    this.textColor = Colors.white,
    this.fontSize = 26,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(text),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 35,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
