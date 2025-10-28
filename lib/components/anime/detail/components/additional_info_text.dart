import 'package:flutter/material.dart';

class AdditionalInfoText extends StatelessWidget {
  final String? headText;
  final Color? headTextcolor;
  final FontWeight headFontWeight;
  final double? headFontSize;

  final String? infoText;
  final Color? infoTextColor;
  final FontWeight infoFontWeight;
  final double? infoFontSize;

  const AdditionalInfoText({
    super.key,
    required this.infoText,
    required this.headText,
    this.headTextcolor = Colors.white,
    this.headFontWeight = FontWeight.w500,
    this.headFontSize = 14,
    this.infoTextColor = Colors.white,
    this.infoFontWeight = FontWeight.w500,
    this.infoFontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headText ?? "",
          style: TextStyle(
            color: headTextcolor,
            fontSize: headFontSize,
            fontWeight: headFontWeight,
          ),
        ),

        Text(
          infoText ?? "",
          softWrap: true,
          style: TextStyle(
            color: infoTextColor,
            fontSize: infoFontSize,
            fontWeight: infoFontWeight,
          ),
        ),
      ],
    );
  }
}
