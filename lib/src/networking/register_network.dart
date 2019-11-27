import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plants_app/src/models/user.dart';
import 'package:plants_app/src/networking/urls.dart';

class RegisterNetwork {
  Future<void> postUser(User user) async {
    final res = await http.post(
      '$baseURL/sign_up/',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );
    print(res.statusCode);
    print(res.body);
    print(user.toJson());
  }
}