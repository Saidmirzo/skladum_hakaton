import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';
import 'app_text_style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.leading,
    this.focusNode,
    this.height,
    this.onTap,
    this.radius,
    this.onSubmitted,
    this.textInputType,
    this.inputFormatters,
    this.onChanged,
    this.backgroundColor,
    this.style,
    this.contentPadding,
    this.hintStyle,
    this.borderColor,
    this.maxLines,
    this.isPassword = false,
    this.readOnly,
    this.errorText,
    this.textInputAction,
    this.trailing,
    this.validator,
    this.minLines,
    this.textCalitalization,
    this.labelText,
  });

  final bool? readOnly;
  final TextEditingController? controller;
  final String? hintText, labelText;
  final TextStyle? style, hintStyle;
  final String? errorText;
  final Widget? leading, trailing;
  final double? radius, height;
  final int? maxLines, minLines;
  final Color? backgroundColor, borderColor;
  final void Function(String value)? onSubmitted;
  final void Function(String value)? onChanged;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final EdgeInsets? contentPadding;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isPassword;
  final FocusNode? focusNode;
  final TextCapitalization? textCalitalization;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        readOnly: widget.readOnly ?? false,
        cursorColor: AppColors.borderColor,
        obscureText: widget.isPassword == true ? isHide : false,
        obscuringCharacter: '*',
        onTap: () {
          if (widget.onTap != null) {
            print('Call back');
            widget.onTap!();
          }
        },
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        style: widget.style ?? AppTextStyles.body16w4,
        controller: widget.controller,
        onFieldSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        textCapitalization:
            widget.textCalitalization ?? TextCapitalization.sentences,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.labelText,
          // labelStyle: AppTextStyles.body16w4.copyWith(color: AppColors.gray),
          isDense: true,
          contentPadding: widget.contentPadding ?? const EdgeInsets.all(10),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 20, minHeight: 20),
          prefixIcon: widget.leading,
          suffixIconConstraints:
              const BoxConstraints(minWidth: 20, minHeight: 20),
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  icon: Icon(
                    isHide ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black.withOpacity(.25),
                  ),
                  onPressed: () {
                    setState(() {
                      isHide = !isHide;
                    });
                  },
                )
              : widget.trailing,
          errorText: widget.errorText,
          errorMaxLines: 3,
          filled: true,
          fillColor: widget.backgroundColor ?? Colors.white,
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 1),
              borderRadius: BorderRadius.circular(widget.radius ?? 20)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 1),
              borderRadius: BorderRadius.circular(widget.radius ?? 20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? Colors.black),
              borderRadius: BorderRadius.circular(widget.radius ?? 20)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? Colors.black),
              borderRadius: BorderRadius.circular(widget.radius ?? 20)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? Colors.black),
              borderRadius: BorderRadius.circular(widget.radius ?? 20)),
          border: InputBorder.none,
          hintStyle: widget.hintStyle ??
              AppTextStyles.body16w4.copyWith(color: AppColors.gray),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
