import 'package:flutter/cupertino.dart';
import 'package:skladum/features/home/precentation/pages/home.dart';

class Routes {
  static const home = '/';
  static const basket = '/basket';
  static const comment = '/comment';
  static const saleInfo = '/saleInfo';
  static const payment = '/payment';
  static const endPayment = '/endPayment';
  static const endShift = '/endShift';
  static const payMoneyPage = '/payMoneyPage';
  static const paymentInCashPage = '/paymentInCashPage';
  static const mixedPaymentPage = '/mixedPaymentPage';
  static const discountPage = '/discountPage';
  static const receiptPage = '/receiptPage';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    try {
      final Map<String, dynamic>? args =
          settings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (settings.name) {
        case home:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const HomePage(),
          );

        default:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const HomePage(),
          );
      }
    } catch (e) {
      return CupertinoPageRoute(
        settings: const RouteSettings(),
        builder: (_) => const HomePage(),
      );
    }
  }
}
