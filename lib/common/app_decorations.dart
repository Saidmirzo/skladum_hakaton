import 'package:flutter/material.dart';
import 'package:skladum/common/app_color.dart';


abstract class AppDecorations {
  static BoxDecoration defDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    // color: AppColors.metalColor.shade10,
  );

  static ButtonStyle buttonStyle({
    double? borderRadius,
    Color? bgColor,
    EdgeInsets? padding,
    BorderSide? border,
    AlignmentGeometry? aligment,
    Size? size,
  }) {
    return ButtonStyle(
      alignment:aligment ,
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          side: border ?? BorderSide.none,
        ),
      ),
      // maximumSize: MaterialStatePropertyAll(size),
      fixedSize: MaterialStatePropertyAll(size),
      backgroundColor: MaterialStateProperty.all(bgColor ?? AppColors.white),
      overlayColor: MaterialStateProperty.all(AppColors.black.withOpacity(.2)),
      padding: MaterialStateProperty.all(padding),
    );
  }
}
