import 'dart:convert';

import 'package:http/http.dart' as http;

import '../networking/urls.dart';
import '../models/plant_family.dart';

class FamilyNetwork {
  Future<List<PlantFamily>> getAllFamilies() async {
    List<PlantFamily> families = List();

    final res = await http.get('$baseURL/family');

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      if (data == null) return [];
      for (var item in data['results']) {
        final plant = PlantFamily.fromJson(item);
        families.add(plant);
      }
      return families;
    } else {
      return families;
    }
  }
}
