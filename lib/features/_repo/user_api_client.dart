import 'package:dio/dio.dart';
import 'package:mobxasync/features/_network/dio_helper.dart';

class UserApiClient {
  final Dio _dio = DioHelper.instance;

  Future<Response> list({String search, num page, num limit}) async {
    return _dio.get(
      '/User',
      queryParameters: {"name": search, "page": '$page', "limit": '$limit'},
    );
  }
}

//User?page = 1 & limit = 30
