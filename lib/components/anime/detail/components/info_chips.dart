import 'package:flutter/material.dart';

class InfoChips extends StatelessWidget {
  final String? text;
  final Color? bgColor;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  const InfoChips({
    super.key,
    required this.text,
    this.bgColor = const Color(0xFF242424),
    this.textColor = const Color(0xFFFFFFFF),
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(minWidth: 80, minHeight: 30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text!,
        style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
