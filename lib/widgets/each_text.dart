
import 'package:flutter/material.dart';

class EachText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  const EachText({
    this.fontSize,
    required this.text,
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}

// requires String title, required String value
// Row
// title
// value