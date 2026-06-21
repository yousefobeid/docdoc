import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/constants.dart';
import '../helpers/shared_pref.dart';

class DioFactory {
  /// private constructor as this is a singleton
  /// private constructor as I do not want to allow creating a instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          sendTimeout: timeOut,
        ),
      );
      // addDioHeaders();
      addDioInterceptors();
    }

    return dio!;
  }

  static void addDioHeaders() async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization':
      //     'Bearer ${await SharedPrefHelper.getString(SharedPrefKey.userToken)}',
    };
  }
  // static void setTokenAfterLogin(String token) {
  //   dio?.options.headers['Authorization'] = 'Bearer $token';
  // }

  static void addDioInterceptors() {
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SharedPrefHelper.getString(
            SharedPrefKey.userToken,
          );

          options.headers['Authorization'] = 'Bearer $token';

          handler.next(options);
        },
      ),
    );

    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
}
