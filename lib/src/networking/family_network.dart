import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/plant_family.dart';
import '../networking/urls.dart';

class FamilyNetwork {
  Future<List<Family>> getAllFamilies() async {
    List<Family> families = List();

    final res = await http.get('$baseURL/family');

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
