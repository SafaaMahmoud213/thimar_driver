import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/logic/cache_helper.dart';

class DioHelper {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: "https://thimar.amr.aait-d.com/api/",
    ),
  );
  static Future<CostemResponse> send(String path,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
      );
      return CostemResponse(
        isSuccess: true,
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioException catch (ex) {
      return CostemResponse(
        isSuccess: false,
        statusCode: ex.response?.statusCode,
        data: ex.response?.data,
        msg: ex.response?.data["message"],
      );
    }
  }

  static Future<CostemResponse> get(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    _dio.options.headers = {"Authorization": "Bearer ${CachHelper.token}"};
    log(_dio.options.headers.toString());
    try {
      final response = await _dio.get(
        path,
        queryParameters: data,
      );
      log(response.data.toString());
      return CostemResponse(
        isSuccess: true,
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioException catch (ex) {
      return CostemResponse(
        isSuccess: false,
        statusCode: ex.response?.statusCode,
        msg: ex.error.toString(),
      );
    }
  }
}

class CostemResponse {
  final String msg;
  final bool isSuccess;
  final data;
  final int? statusCode;
  CostemResponse({
    this.msg = "",
    required this.isSuccess,
    this.data,
    this.statusCode,
  });
}
