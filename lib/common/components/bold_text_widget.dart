import 'package:flutter/material.dart';
import 'package:skladum/common/app_color.dart';
import 'package:skladum/common/app_text_style.dart';

class BoldTextWidget extends StatelessWidget {
  const BoldTextWidget({
    super.key,
    required this.leading,
    required this.trailing,
    this.isBold = false,
    this.padding,
  });
  final String leading;
  final int? trailing;
  final bool? isBold;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: isBold ?? false
                ? AppTextStyles.body18w7
                : AppTextStyles.body14w3
                    .copyWith(color: AppColors.black.withOpacity(.4)),
          ),
          Text(
            trailing.toString(),
            style: isBold ?? false
                ? AppTextStyles.body18w7
                : AppTextStyles.body14w3
                    .copyWith(color: AppColors.black.withOpacity(.4)),
          ),
        ],
      ),
    );
  }
}
