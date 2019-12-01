import 'dart:convert';
import 'package:http/http.dart' as http;

import 'base_network.dart';
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
  }
}
