import 'dart:convert';

import 'package:mobxasync/features/_model/user.dart';

import 'user_api_client.dart';

class UserRepo {
  static UserApiClient _client;

  static UserApiClient get _i {
    _client ??= UserApiClient();
    return _client;
  }

  Future<List<User>> list({String search, num page, num limit}) async {
    var response = await _i.list(search: search, limit: limit, page: page);

    print(response.data);

    return response.data.map<User>((u) => User.fromJson(u)).toList();
  }
}
