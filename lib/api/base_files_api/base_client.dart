import 'package:chat_app_auth/api/base_files_api/logger_interceptor.dart';
import 'package:chat_app_auth/logic/localData/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'end_point_api.dart';

class BaseClient {
  BaseClient._();

  static final BaseClient _instance = BaseClient._();

  factory BaseClient() {
    return _instance;
  }

  final _dio = Dio(
    BaseOptions(
      connectTimeout: EndPoints.connectTimeout,
      receiveTimeout: EndPoints.receiveTimeout,
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        "Content-Type": "application/json",
        // "Authorization": SharedPrefController().getLogedin()
        //     ? "Bearer ${SharedPrefController().getUser().token.accessToken}"
        //     : '',
        // 'lang': 'en'
      },
    ),
  )..interceptors.addAll([
      if (kDebugMode) LoggerInterceptor(),
    ]);

  Future<Response> get(
    String path, {
    // Options? options,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return await _dio.get(
      path,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
      options: Options(headers: {
        "Authorization": "Bearer ${SharedPrefController().getUser().token.accessToken}",
      }),
    );
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          options: Options(headers: {
            "Authorization": SharedPrefController().getLogedin()
                ? "Bearer ${SharedPrefController().getUser().token.accessToken}"
                : '',
          }));
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {
          "Authorization": "Bearer ${SharedPrefController().getUser().token.accessToken}",
        }),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: {
        "Authorization": "Bearer ${SharedPrefController().getUser().token.accessToken}",
      }),
    );
  }
}
