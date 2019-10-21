import 'dart:convert';

import 'package:plants_app/src/models/plant_specimen.dart';
import 'package:http/http.dart' as http;
import 'package:plants_app/src/networking/urls.dart';

class SpecimenNetwork {
  Future<List<PlantSpecimen>> getAllSpecimens() async {
    List<PlantSpecimen> specimens = [];

    final res = await http.get('$baseURL/specimen');

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      if (data == null) return [];

      for (var item in data['results']) {
        final plant = PlantSpecimen.fromJson(item);
        specimens.add(plant);
      }
      return specimens;
    } else {
      return specimens;
    }
  }

  Future<void> postSpecimen(PlantSpecimen specimen) async {
    final res = await http.post(
      '$baseURL/specimen',
      body: jsonEncode(specimen.toJson()),
    );

    print(res.statusCode);
  }
}
