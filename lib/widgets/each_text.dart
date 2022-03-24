import 'package:flutter/material.dart';

class EachText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  const EachText({
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    required this.text,
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      textAlign: textAlign,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
