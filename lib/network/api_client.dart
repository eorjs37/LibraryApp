import 'package:dio/dio.dart';
import 'package:flutter_app/exception/api_exception.dart';

class ApiClient {
  static late final Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8080', // Android Emulator
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),

        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('➡️ ${options.method} ${options.uri}');
          return handler.next(options);
        },

        onResponse: (response, handler) {
          print('✅ ${response.statusCode}');
          return handler.next(response);
        },

        onError: (error, handler) {
          final statusCode = error.response?.statusCode ?? 500;
          final message =
              error.response?.data['message'] ??
              error.message ??
              'Unknown Error';

          switch (statusCode) {
            case 400:
              throw BadRequestException(message, statusCode: statusCode);
            case 500:
            case 502:
            case 503:
              throw ServerErrorException(message, statusCode: statusCode);

            default:
              throw UnknownApiException(message);
          }
        },
      ),
    );
  }
}
