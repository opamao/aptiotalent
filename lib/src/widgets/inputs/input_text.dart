import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../themes/themes.dart';

class InputText extends StatefulWidget {
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
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _isFocused
              ? (widget.borderColor ?? appColor)
              : Colors.transparent,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(3.w),
      ),
      //padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: TextFormField(
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.obscureText,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.w),
            borderSide: BorderSide.none,
          ),
          fillColor: widget.colorFille ?? appColor.withOpacity(.08),
          filled: true,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
        maxLines: widget.maxLines ?? 1,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.validatorMessage;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
