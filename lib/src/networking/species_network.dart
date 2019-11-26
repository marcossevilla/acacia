import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/plant_species.dart';
import '../networking/urls.dart';

class SpeciesNetwork {
  Future<List<Species>> getAllSpecies() async {
    List<Species> species = [];

    final res = await http.get('$baseURL/species');

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      if (data == null) return [];

      for (var item in data['results']) {
        final plant = Species.fromJson(item);
        species.add(plant);
      }
      return species;
    } else {
      return species;
    }
  }
}
