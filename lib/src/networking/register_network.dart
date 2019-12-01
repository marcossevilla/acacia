import 'dart:convert';
import 'package:http/http.dart' as http;

import 'base_network.dart';
import '../models/user.dart';
import '../shared/preferences.dart';

final prefs = UserPreferences();

class RegisterNetwork {
  Future<void> postUser(User user) async {
    final res = await http.post(
      '$baseURL/sign_up/',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );
    refreshTokens(res);
  }
}
