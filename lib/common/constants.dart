import 'package:flutter/material.dart';
import 'package:skladum/common/app_color.dart';
import 'package:skladum/common/assets.dart';
import 'package:skladum/common/enums/history_status.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> drewerMenu = [
  "Продажа",
  "История",
  "Смена",
  "Настройки",
  "Помошь",
  "Выйти"
];
List<String> appbarTitles = [
  "Продажа",
  "История",
  "Смена",
  "Настройки",
  "Помошь"
];
Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    throw 'Could not launch $launchUri';
  }
}
String saleInfoReturn(HistoryStatus status) {
  String name = '';
  switch (status) {
    case HistoryStatus.sale:
      name = "Продажи";
      break;
    case HistoryStatus.returns:
      name = "Возврат";
      break;
    case HistoryStatus.change:
      name = "Выплата";
      break;
    default:
      name = '';
      break;
  }
  return name;
}


class DefImageWidget extends StatelessWidget {
  const DefImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.background),
          image: DecorationImage(image: AssetImage(Assets.images.kassaIcon))),
    );
  }
}
