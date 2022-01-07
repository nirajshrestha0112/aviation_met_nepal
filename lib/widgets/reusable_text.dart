import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final bool colorData;
  const ReusableText({
    required this.text,
    this.colorData = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(-16.0, 0.0, 0.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: SizeConfig.textMultiplier! * 2.0,
            color: colorData ? iconColor : textColor),
      ),
    );
  }
}