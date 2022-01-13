import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomIcon
 extends StatelessWidget {
  final IconData icon;
  const CustomIcon
  ({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: textColor,
      size: SizeConfig.imageSizeMultiplier! * 6.0,
    );
  }
}