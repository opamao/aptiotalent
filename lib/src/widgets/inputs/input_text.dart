import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../themes/themes.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? validatorMessage;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final Color? colorFille;
  final List? inputFormatters;
  final bool isClickable;
  final VoidCallback? onTap;
  final Color? borderColor;

  const InputText({
    super.key,
    required this.controller,
    this.validatorMessage,
    this.keyboardType,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.isClickable = false,
    this.maxLines,
    this.maxLength,
    this.inputFormatters,
    this.colorFille,
    this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: borderColor == null ? Border.all(color: appBlack) : null,
        borderRadius: BorderRadius.circular(3.w),
      ),
      //padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.w),
            borderSide: BorderSide.none,
          ),
          fillColor: colorFille ?? Colors.white,
          filled: true,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        maxLines: maxLines ?? 1,
        validator: (value) {
          if (value!.isEmpty) {
            return validatorMessage;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
