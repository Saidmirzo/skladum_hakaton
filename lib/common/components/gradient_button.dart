import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skladum/common/app_color.dart';
import 'package:skladum/common/app_text_style.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.radius,
    this.height,
    this.icon,
    this.textStyle,
    this.width,
    this.color,
    this.elevation,
    this.border,
    this.isLoading = false,
    this.replaceTextVSIcon = false,
  });

  final Function()? onPressed;
  final String text;
  final double? radius;
  final double? height;
  final double? width, elevation;
  final Widget? icon;
  final TextStyle? textStyle;
  final Color? color;
  final BoxBorder? border;
  final bool isLoading;
  final bool? replaceTextVSIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: color,
          minimumSize:
              Size(width ?? MediaQuery.of(context).size.width, height ?? 46),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8))),
      child: Ink(
        decoration: BoxDecoration(
            color: color,
            border: border,
            gradient: color == null ? AppColors.gradient : null,
            borderRadius: BorderRadius.circular(radius ?? 8)),
        child: Container(
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? 46,
          alignment: Alignment.center,
          child: isLoading
              ? CircularProgressIndicator(color: AppColors.white)
              : replaceTextVSIcon == false
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            text,
                            maxLines: 1,
                            style: textStyle ??
                                AppTextStyles.body20w4
                                    .copyWith(color: AppColors.white),
                          ),
                        ),
                        const SizedBox(width: 4),
                        icon ?? const SizedBox.shrink(),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        icon ?? const SizedBox.shrink(),
                        const SizedBox(width: 4),
                        Text(
                          text,
                          style: textStyle ??
                              AppTextStyles.body20w4
                                  .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
