import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plants_app/src/models/credentials.dart';
import 'package:plants_app/src/networking/urls.dart';

class CredentialsNetwork {
  Future<void> postLogin(Credentials credentials) async {
    final res = await http.post(
      '$baseURL/login/',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(credentials.toJson()),
    );
    print(res.statusCode);
    print(res.body);
    print(credentials.toJson());
  }
}