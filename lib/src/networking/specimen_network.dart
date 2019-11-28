import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plants_app/src/utils/utils.dart';

import '../networking/urls.dart';
import '../shared/preferences.dart';
import '../models/plant_specimen.dart';
import '../models/nested_specimen.dart';

final prefs = UserPreferences();

class SpecimenNetwork {
  Future<List<PlantSpecimen>> getAllSpecimens() async {
    List<PlantSpecimen> specimens = [];

    final res = await http.get('$baseURL/plant_specimen/');

    refreshTokens(res);

    // print(res.statusCode);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      if (data == null) return [];

      for (var item in data) {
        final plant = PlantSpecimen.fromJson(item);
        specimens.add(plant);
      }
      return specimens;
    } else {
      return specimens;
    }
  }

  Future<bool> postSpecimen(NestedSpecimen specimen) async {
    final res = await http.post(
      '$baseURL/plant_specimen/',
      body: jsonEncode(specimen.toJson()),
      headers: {
        "Content-Type": "application/json",
        'Cookie': '${prefs.token};${prefs.tokenRefresh}',
        // 'Cookie': '${prefs.tokenRefresh}',
      },
    );

    refreshTokens(res);

    print('Registro especimen: ${res.statusCode}');

    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
