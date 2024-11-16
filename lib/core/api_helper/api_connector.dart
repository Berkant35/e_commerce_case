import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import '../config/api_config.dart';
import 'app_exception.dart';

class ApiConnector {
  late Dio _dio;

  /// Initialize
  ApiConnector();

  /// initialize the Dio instance
  void init(String baseUrl, Map<String, dynamic>? headers) {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      sendTimeout: ApiConfig.sendTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return status != null && status >= 200 && status < 300;
      },
      contentType: Headers.jsonContentType,
      receiveDataWhenStatusError: true,
    );

    _dio = Dio(baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        handler.next(e);
      },
    ));
  }

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.get(url, options: Options(headers: headers)).timeout(
        ApiConfig.crudTimeout,
        onTimeout: () => throw TimeoutException('Connection timed out'),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<dynamic> post(String url, {required Object body, Map<String, String>? headers}) async {
    try {
      final response = await _dio.post(url, data: body, options: Options(headers: headers)).timeout(
        ApiConfig.crudTimeout,
        onTimeout: () => throw TimeoutException('Connection timed out'),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<dynamic> delete(String url, {Map<String, String>? headers, Object? body}) async {
    try {
      final response = await _dio.delete(url, data: body, options: Options(headers: headers)).timeout(
        ApiConfig.crudTimeout,
        onTimeout: () => throw TimeoutException('Connection timed out'),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return _convertToJson(response.data);
      case 401:
        throw UnauthorisedException('Unauthorized access: ${response.statusMessage}');
      default:
        throw BadRequestException('Error ${response.statusCode}: ${response.statusMessage}');
    }
  }

  dynamic _convertToJson(dynamic responseBody) {
    if (responseBody is String) {
      return json.decode(responseBody);
    } else {
      return responseBody;
    }
  }

  void _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
      throw FetchDataException('Timeout occurred');
    } else if (e.type == DioExceptionType.badResponse) {
      final response = e.response;
      if (response != null) {
        _handleResponse(response);
      }
    } else if (e.type == DioExceptionType.cancel) {
      throw InterruptException('Interrupt error: ${e.message}');
    }else if(e.type == DioExceptionType.badCertificate){
      throw NetworkException('Bad certificate error: ${e.message}');
    } else if (e.type == DioExceptionType.connectionError) {
      throw NetworkException('Connection error: ${e.message}');
    } else if (e.type == DioExceptionType.sendTimeout) {
      throw TimeOutException('Send timeout error: ${e.message}');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      throw TimeOutException('Receive timeout error: ${e.message}');
    } else if (e.type == DioExceptionType.unknown) {
      throw UnknownException('Unknown error: ${e.message}');
    } else {
      throw UnknownException('Unexpected error: ${e.message}');
    }
  }
}
