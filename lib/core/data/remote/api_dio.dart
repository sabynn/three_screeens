import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _options = Options(
  receiveTimeout: const Duration(seconds: 5000),
  sendTimeout: const Duration(seconds: 6000),
);

Future<Response<dynamic>> getIt(
    String url, {
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
    }) async {
  if (kDebugMode) {
    Logger().i({
      'url': url,
    });
  }

  final resp = await Dio().get<Map<String, dynamic>>(
    url,
    options: _options,
    queryParameters: queryParameters,
  );
  if (kDebugMode) {
    Logger().i({
      'response': '${resp.data}',
      'statusCode': '${resp.statusCode}',
    });
  }
  return resp;
}

