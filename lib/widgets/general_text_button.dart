import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class GeneralTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  const GeneralTextButton({
    required this.text,
    required this.onPressed,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? SizeConfig.heightMultiplier! * 7.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(elevation: 0.0, primary: iconColor),
        child: Text(
          text,
          style: TextStyle(fontSize: SizeConfig.textMultiplier! * 2.0),
        ),
      ),
    );
  }
}
