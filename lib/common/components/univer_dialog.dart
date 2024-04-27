import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:skladum/common/app_color.dart';
import 'package:skladum/common/app_text_style.dart';

class UniverDialog extends StatelessWidget {
  const UniverDialog(
      {super.key,
      required this.gcontext,
      this.yes,
      this.no,
      required this.title});
  final BuildContext gcontext;
  final void Function()? yes;
  final void Function()? no;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black, width: .5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.body16w4,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: yes,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                          right: BorderSide(),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: AppTextStyles.body16w4
                            .copyWith(color: AppColors.green),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      no;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: AppTextStyles.body16w4
                            .copyWith(color: AppColors.red),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
