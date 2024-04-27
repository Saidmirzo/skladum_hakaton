import 'package:flutter/material.dart';

class AppColors {
  //device
  static Color transparent = Colors.transparent;
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color black = Colors.black;
  static Color grey = Colors.grey;
  static Color blue = const Color(0xff4EB4FF);

  // Primary
  static Color switchColor = const Color(0xffAFFCFF);
  static Color background = const Color.fromRGBO(48, 197, 203, 1);
  static Color indicatorColor = const Color(0xff30C5CB);
  static Color storyIndicatorColor = const Color(0xff48F8FF);
  static Color grayLight = Colors.grey.shade200;
  static Color darkGray = const Color(0xff373C42);
  static Color borderLight = const Color(0xff9BA2A8);
  static Color borderColor = const Color(0xff003748);
  static Color colorB8 = const Color(0xffB8B8B8);
  static Color color72 = const Color(0xff727272);
  static Color colorC9 = const Color(0xffC9C9C9);
  static Color color84 = const Color(0xff848484);
  static Color colorEE = const Color(0xffEEEEEE);
  static Color colorF5 = const Color(0xffF5F5F5);
  static Color color55 = const Color(0xff555555);
  static Color otherCh = const Color(0xffE1EAF1);

  static Color storyBorderColor = const Color(0xffA8FFFA);
  static Color gray = Colors.grey.shade400;
  static Color musicShadow = const Color(0xff101012).withOpacity(0.25);
  static Color red = Colors.red.shade500;
  static Color green = const Color(0xff00EB86);
  static LinearGradient gradient = const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Color(0xff0C9AFE),
        Color(0xff10CFFF),
        Color(0xff0FC8FF),
        Color(0xff0668B3)
      ]);
static LinearGradient backGradient= LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [AppColors.switchColor, AppColors.white]);
}

class AppShadow {
  static Shadow get defShadow => Shadow(
        color: AppColors.black.withOpacity(0.5),
        blurRadius: 3.0,
        offset: const Offset(0, 0),
      );
}
