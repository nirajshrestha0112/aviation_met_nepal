import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class GeneralTextField extends StatefulWidget {
  final String hintText;
  final IconData icons;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboard;
  const GeneralTextField({
    this.validator,
    this.keyboard,
    this.controller,
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
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.keyboard,
        focusNode: _focusNod,
        obscureText: widget.obscureText ? isHiddenPassword : widget.obscureText,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: widget.hintText,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: radius / 1.5),
              child: Icon(
                widget.icons,
                color: const Color(colorDarkBlue).withOpacity(0.85),
                size: SizeConfig.imageSizeMultiplier * 7.5,
              ),
            ),
            suffixIcon: widget.obscureText
                ? InkWell(
                    onTap: _togglePasswordShow,
                    child: Icon(
                      Icons.visibility,
                      color: isHiddenPassword
                          ? const Color(colorGrey10)
                          : const Color(colorPrimary),
                    ),
                  )
                : null));
  }
}
