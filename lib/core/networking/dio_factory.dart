import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
      addDioHeaders();
      addDioInterceptors();
    }

    return dio!;
  }

  static void addDioHeaders() {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzgxOTY2NDY3LCJleHAiOjE3ODIwNTI4NjcsIm5iZiI6MTc4MTk2NjQ2NywianRpIjoiaFVPazFBVGhHV1c2MFUxUCIsInN1YiI6IjQ2NzUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.sBB-AgKpdv-W41bliIboQr9BMQcrZx9BkPRmoa0OAX8',
    };
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
