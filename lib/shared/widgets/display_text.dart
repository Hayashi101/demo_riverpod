import 'package:demo_rvp4/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  const DisplayText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.textColors,
      this.maxLines,
      this.textOverflow});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColors;
  final int? maxLines;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleSmall?.copyWith(
        color: textColors ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize,
      ),
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
