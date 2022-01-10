import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/values.dart';
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

class EachTextFormField extends StatefulWidget {
  final String hintText;
  final IconData icons;
  bool obscureText;
  EachTextFormField({
    required this.hintText,
    required this.icons,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  State<EachTextFormField> createState() => _EachTextFormFieldState();
}

class _EachTextFormFieldState extends State<EachTextFormField> {
  bool isHiddenPassword = true;

  void _togglePasswordShow() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
            isDense: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: radius / 1.5),
              child: Icon(
                widget.icons,
                size: SizeConfig.imageSizeMultiplier! * 7.5,
              ),
            ),
            hintStyle: TextStyle(
                color: searchColor,
                fontSize: SizeConfig.textMultiplier! * 2.3,
                fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: bgColor),
                borderRadius: BorderRadius.circular(radius)),
            suffixIcon: widget.obscureText
                ? InkWell(
                    onTap: _togglePasswordShow,
                    child: Icon(isHiddenPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )
                : null));
  }
}

class Bttn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  const Bttn({
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
