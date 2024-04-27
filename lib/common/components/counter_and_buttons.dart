
import 'package:flutter/material.dart';
import 'package:skladum/common/app_color.dart';
import 'package:skladum/common/components/gradient_button.dart';
import 'package:skladum/common/custom_textfield.dart';

class CounterAndButtons extends StatelessWidget {
  const CounterAndButtons({
    super.key,
    required this.productCount,
    this.add,
    this.remove,
  });
  final dynamic Function()? add, remove;

  final TextEditingController productCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GradientButton(
          width: 100,
          onPressed: remove,
          text: '',
          color: AppColors.background,
          icon: Icon(
            Icons.remove,
            color: AppColors.white,
          ),
        ),
        const SizedBox(width: 5),
        Flexible(
          child: CustomTextField(
            hintText: 'Количество',
            labelText: 'Количество',
            radius: 8,
            borderColor: AppColors.background,
            textInputType: TextInputType.number,
            contentPadding: const EdgeInsets.all(12),
            controller: productCount,
            maxLines: 1,
          ),
        ),
        const SizedBox(width: 5),
        GradientButton(
          width: 100,
          color: AppColors.background,
          onPressed: add,
          text: '',
          icon: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
