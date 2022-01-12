import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class GeneralTextField extends StatefulWidget {
  final String hintText;
  final IconData icons;
  final bool obscureText;
  const GeneralTextField({
    required this.hintText,
    required this.icons,
    required this.obscureText,
    Key? key,
  }) : super(key: key);

  @override
  State<GeneralTextField> createState() => _GeneralTextFieldState();
}

class _GeneralTextFieldState extends State<GeneralTextField> {
  bool isHiddenPassword = true;

  void _togglePasswordShow() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.obscureText ? isHiddenPassword : widget.obscureText,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: InputBorder.none,
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
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: bgColor),
                borderRadius: BorderRadius.circular(radius)),
            suffixIcon: widget.obscureText
                ? InkWell(
                    onTap: _togglePasswordShow,
                    child: Icon(isHiddenPassword
                        ? Icons.visibility
                        : Icons.visibility_off))
                : null));
  }
}
