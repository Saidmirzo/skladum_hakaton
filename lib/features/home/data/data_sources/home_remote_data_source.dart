import 'dart:convert';

import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<dynamic> getProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  Dio dio;

  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future getProducts() async {
    var json = {
      // 'phone': phone,
      // 'password': password,
      // 'userAgent': deviceName,
      // "fcm_token": 'tokenpaste',
    };
    final responce = await dio.request(
      '/login',
      data: jsonEncode(json),
      options: Options(
        method: 'POST',
        headers: {
          'accept': 'application/json',
        },
      ),
    );

    return responce.data["token"];
  }
}
