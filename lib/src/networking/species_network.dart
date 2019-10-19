import 'dart:convert';

import 'package:http/http.dart' as http;

import '../networking/urls.dart';
import '../models/plant_species.dart';

class SpeciesNetwork {
  Future<List<PlantSpecies>> getAllSpecies() async {
    List<PlantSpecies> species = [];

    final res = await http.get('$baseURL/species');

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      if (data == null) return [];

      for (var item in data['results']) {
        final plant = PlantSpecies.fromJson(item);
        species.add(plant);
      }
      return species;
    } else {
      return species;
    }
  }
}
