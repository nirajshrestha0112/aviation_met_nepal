import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class GeneralTextField extends StatefulWidget {
  final String hintText;
  final IconData icons;
  final bool obscureText;
  final TextInputType ? keyboard;
  const GeneralTextField({
    this.keyboard,
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

  final FocusNode _focusNod = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:widget.keyboard,
        focusNode: _focusNod,
        obscureText: widget.obscureText ? isHiddenPassword : widget.obscureText,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            //border: InputBorder.none,

            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: radius / 1.5),
              child: Icon(
                widget.icons,
                color: _focusNod.hasFocus ? Colors.grey : Colors.grey,
                size: SizeConfig.imageSizeMultiplier! * 7.5,
              ),
            ),
            hintStyle: TextStyle(
                color: searchColor,
                fontSize: SizeConfig.textMultiplier! * 2.3,
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
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
