import 'package:dio/dio.dart';

class Parsed<T> {
  Parsed.fromJson(
      Map<String, dynamic> json,
      this.statusCode,
      this.data,
      ) {
    message = (json['error'] ?? json['detail'] ?? '') as String;
  }

  Parsed.fromPaginationJson(
      Map<String, dynamic> json,
      this.statusCode,
      this.data,
      ) {
    message = (json['error'] ?? json['detail'] ?? '') as String;
  }

  Parsed.fromDynamicData(this.statusCode, this.data);

  late int statusCode;
  late String message;
  late T data;
}


extension ResponseExtension<T> on Response<dynamic> {
  //ignore:avoid_shadowing_type_parameters
  Parsed<T> parse<T>(T t) {
    return Parsed.fromJson(
      data as Map<String, dynamic>,
      statusCode!,
      t,
    );
  }

  //ignore:avoid_shadowing_type_parameters
  Parsed<T> parseDynamicData<T>(T t) {
    return Parsed.fromDynamicData(
      statusCode!,
      t,
    );
  }

  dynamic get responseData => (data as Map<String, dynamic>)['data'];

  dynamic get dataBodyIterable => (data as Map<String, dynamic>)['data'];

  Map<String, dynamic> get bodyAsMap => data as Map<String, dynamic>;

  Map<String, dynamic> get bodyMap => data as Map<String, dynamic>;

  List<dynamic> get bodyList => data as List<dynamic>;
}