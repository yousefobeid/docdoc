import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as this is a singleton
  /// private constructor as I do not want to allow creating a instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio()  {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          sendTimeout: timeOut,
        ),
      );

      addDioInterceptors();
    }

    return dio!;
  }

  static void addDioInterceptors() {
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
