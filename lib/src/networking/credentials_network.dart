import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plants_app/src/models/credentials.dart';
import 'package:plants_app/src/networking/urls.dart';
import 'package:plants_app/src/shared/preferences.dart';
import 'package:toast/toast.dart';

class CredentialsNetwork {
  UserPreferences preferences = UserPreferences();

  Future<void> postLogin(Credentials credentials) async {
    final res = await http.post(
      '$baseURL/login/',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(credentials.toJson()),
    );

    res.headers.forEach((k,v) => {
      if (k == "set-cookie") {
        preferences.token = v
      }
      else if (k == "token-refresh") {
        preferences.tokenRefresh = v
      }

    });

    print("Toke: ${preferences.token}");
    print("Token refresh: ${preferences.tokenRefresh}");

    print(res.statusCode);
    print(res.body);
    print(credentials.toJson());
  }
}