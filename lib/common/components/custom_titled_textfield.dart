import 'package:flutter/material.dart';
import 'package:skladum/common/all_contants.dart';
import 'package:skladum/common/custom_textfield.dart';

class CustomTitledTextField extends StatelessWidget {
  const CustomTitledTextField({
    super.key,
    required this.title,
    this.textEditingController,
    this.maxLines,
    this.textFieldHeight,
    this.onChange,
  });
  final String title;
  final TextEditingController? textEditingController;
  final int? maxLines;
  final double? textFieldHeight;
  final Function(String value)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.body14w4.copyWith(color: AppColors.grey),
        ),
        CustomTextField(
          onChanged: onChange,
          controller: textEditingController,
          borderColor: AppColors.grey,
          radius: 5,
          height: textFieldHeight,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
