import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/utils.dart';
import '../networking/urls.dart';
import '../shared/preferences.dart';
import '../models/credentials.dart';

class CredentialsNetwork {
  UserPreferences preferences = UserPreferences();

  Future<void> postLogin(Credentials credentials) async {
    final res = await http.post(
      '$baseURL/login/',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(credentials.toJson()),
    );

    refreshTokens(res);

    print("Token: ${preferences.token}");
    print("Token refresh: ${preferences.tokenRefresh}");

    print(res.statusCode);
    print(res.body);
    print(credentials.toJson());
  }
}
