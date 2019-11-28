import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:plants_app/src/shared/preferences.dart';
import 'package:plants_app/src/utils/utils.dart';

import '../models/plant_family.dart';
import '../networking/urls.dart';

final prefs = UserPreferences();

class FamilyNetwork {
  Future<List<Family>> getAllFamilies() async {
    List<Family> families = List();

    final res = await http.get(
      '$baseURL/family',
      headers: {
        "Content-Type": "application/json",
        'Cookie': '${prefs.token};${prefs.tokenRefresh}',
        // 'Cookie': '${prefs.tokenRefresh}',
      },
    );

    refreshTokens(res);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      if (data == null) return [];
      for (var item in data) {
        final plant = Family.fromJson(item);
        families.add(plant);
      }
      return families;
    } else {
      return families;
    }
  }
}
