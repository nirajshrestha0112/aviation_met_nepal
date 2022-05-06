import 'dart:developer';

import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/utils/get_device_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralTextFormField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcons;
  final IconData? suffixIcons;
  final double? suffixIconsSize;
  final EdgeInsetsGeometry? contextPadding;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final bool prefixIconsPadding;
  final TextInputType? keyboard;
  const GeneralTextFormField({
    this.validator,
    this.keyboard,
    this.suffixIconsSize,
    this.contextPadding,
    this.prefixIconsPadding = true,
    this.suffixIcons,
    this.controller,
    required this.hintText,
    this.prefixIcons,
    required this.obscureText,
    Key? key,
  }) : super(key: key);

  @override
  State<GeneralTextFormField> createState() => _GeneralTextFormFieldState();
}

class _GeneralTextFormFieldState extends State<GeneralTextFormField> {
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
        contentPadding: widget.contextPadding != null
            ? widget.contextPadding
            : DeviceUtil.isMobile
                ? EdgeInsets.zero
                : EdgeInsets.symmetric(vertical: 16.h),
        prefixIcon: widget.prefixIconsPadding
            ? Padding(
                padding: EdgeInsets.only(
                    bottom: DeviceUtil.isMobile ? 4.h : 8.h,
                    left: DeviceUtil.isMobile ? 0.w : 4.w),
                child: Icon(
                  widget.prefixIcons,
                  color: const Color(colorDarkBlue).withOpacity(0.85),
                  size: 24.w,
                ),
              )
            : null,
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: _togglePasswordShow,
                child: Padding(
                  padding:
                      EdgeInsets.only(right: DeviceUtil.isMobile ? 0.w : 8.w),
                  child: Icon(
                    widget.suffixIcons ?? Icons.visibility,
                    size: widget.suffixIconsSize ?? 20.w,
                    color: isHiddenPassword
                        ? const Color(colorGrey10)
                        : const Color(colorPrimary),
                  ),
                ),
              )
            : widget.suffixIcons != null
                ? Icon(
                    widget.suffixIcons ?? Icons.visibility,
                    size: widget.suffixIconsSize ?? 20.w,
                    color: const Color(colorPrimary),
                  )
                : null,
      ),
    );
  }
}
