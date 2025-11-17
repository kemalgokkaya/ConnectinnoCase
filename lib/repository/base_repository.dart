import 'dart:convert';
import 'package:connectinno_case/core/enum/request_type.dart';
import 'package:connectinno_case/core/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DataBaseRepository {
  static final DataBaseRepository _instance = DataBaseRepository._internal();
  DataBaseRepository._internal();
  factory DataBaseRepository() => _instance;

  Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8000",
      responseType: ResponseType.json,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  Future<Response> executeRequest(
    RequestType requestType,
    String path, {
    body,
    bool authorization = true,
    isFormData = false,
  }) async {
    Response response;

    AppLogger.log("-------------------Request--------------------");
    AppLogger.log("Url => ${dio.options.baseUrl}$path");
    AppLogger.log("Path => $path");
    AppLogger.log("Header => ${dio.options.headers}");
    AppLogger.log("Body => ${jsonEncode(body)}");

    try {
      response = await switch (requestType) {
        RequestType.get => dio.get(path, data: body),
        RequestType.post => dio.post(path, data: body),
        RequestType.put => dio.put(path, data: body),
        RequestType.delete => dio.delete(path, data: body),
        RequestType.patch => dio.patch(path, data: body),
      };

      AppLogger.log("statusCode => ${response.statusCode}");
      AppLogger.log("Response => ${response.data}");
      AppLogger.log("-----------------Request End------------------");
      return response;
    } catch (e, st) {
      FlutterError.dumpErrorToConsole(
        FlutterErrorDetails(exception: e, stack: st),
      );
      rethrow;
    }
  }
}
