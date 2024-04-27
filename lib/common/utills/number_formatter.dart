import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension NumberFormatter on String {
  String formatAsNumber() {
    final number = num.tryParse(replaceAll(' ', ''));
    if (number != null) {
      final formatter = NumberFormat('#,##0');
      return formatter.format(number).replaceAll(',', ' ');
    }
    return this;
  }
}

num numParser(String? text) {
  var replaceText = text?.replaceAll(' ', '');
  if (text != null) {
    return num.parse(
        (replaceText?.isNotEmpty ?? false) ? '${replaceText ?? 0}' : '0');
  }
  return 0;
}

extension PhoneFormatter on String {
  String get phone {
    var code = substring(0, 2);
    var h = substring(2, 5);
    var s = substring(5, 7);
    var t = substring(7);
    return '+998 ($code) $h - $s - $t';
  }
}

extension PhoneFormatter2 on String {
  String get phone2 {
    var code = substring(0, 2);
    var h = substring(2, 5);
    var s = substring(5, 7);
    var t = substring(7);
    return '+998 ($code) $h-$s-$t';
  }
}

extension DateFormatter on String {
  String formatDate() {
    DateTime dateTime = DateTime.parse(this);
    DateFormat dateFormat = DateFormat("HH:mm  dd-MM-yyyy");
    String output = dateFormat.format(dateTime);
    return output;
  }
}

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final String formattedText =
        newValue.text.replaceAll(RegExp(r'\s+'), '').replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match match) => '${match[1]} ',
            );

    return TextEditingValue(
      text: formattedText,
      selection: newValue.selection.copyWith(
        baseOffset: formattedText.length,
        extentOffset: formattedText.length,
      ),
    );
  }
}

String dateFormatter(DateTime time) {
  String formatterDate = DateFormat('dd-MM-yyyy').format(time);
  return formatterDate;
}

String dateFormatterReverse(DateTime time) {
  String formatterDate = DateFormat('yyyy-MM-dd').format(time);
  return formatterDate;
}

String capitalizeFirstLetter(String? text) {
  if (text == null || text.isEmpty) {
    return text ?? '';
  }
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}
