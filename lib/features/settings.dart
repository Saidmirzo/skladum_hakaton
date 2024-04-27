import 'package:flutter/material.dart';
import 'package:skladum/common/app_color.dart';
import 'package:skladum/common/app_text_style.dart';
import 'package:skladum/common/components/gradient_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text('Синхронизация'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: GradientButton(
              onPressed: () {
                // Navigator.pushNamed(context, Routes.chat);
              },
              text: " Синхронизация",
              color: AppColors.white,
              textStyle:
                  AppTextStyles.body16w3.copyWith(color: AppColors.background),
              border: Border.all(color: AppColors.background),
            ),
          ),
          Text(
            'Последняя загрузка данных: 12.12.2023 08:20',
            style: AppTextStyles.body12w3,
          ),
        ],
      ),
    );
  }
}
