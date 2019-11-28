import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:plants_app/src/shared/preferences.dart';
import 'package:plants_app/src/utils/utils.dart';

import '../models/plant_species.dart';
import '../networking/urls.dart';

final prefs = UserPreferences();

class SpeciesNetwork {
  Future<List<Species>> getAllSpecies() async {
    List<Species> species = [];

    final res = await http.get(
      '$baseURL/species',
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
        final plant = Species.fromJson(item);
        species.add(plant);
      }
      return species;
    } else {
      return species;
    }
  }
}
