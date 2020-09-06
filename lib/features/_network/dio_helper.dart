import 'package:dio/dio.dart';

class DioHelper {
  static Dio _instance;

  static Dio get instance {
    _instance ??= Dio(BaseOptions(
        baseUrl: 'https://API KEY.mockapi.io/api/v1',
        contentType: 'application/json'))
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          requestBody: true,
          request: true));

    return _instance;
  }
}
