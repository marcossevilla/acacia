import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plants_app/src/models/genus.dart';

import 'package:plants_app/src/models/plant_specimen.dart';
import 'package:plants_app/src/networking/urls.dart';

class SpecimenPropsNetwork {
  _getData(String url) async {
    final res = await http.get(url);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      if (data == null) return [];
      return data;
    } else {
      return [];
    }
  }

  Future<List<Biostatus>> getBiostatuses() async {
    List<Biostatus> biostatus = List();

    var data = await _getData('$baseURL/biostatus');

    for (var item in data) {
      final status = Biostatus.fromJson(item);
      biostatus.add(status);
    }
    return biostatus;
  }

  Future<List<Genus>> getGenuses() async {
    List<Genus> genuses = List();

    var data = await _getData('$baseURL/genus');

    for (var item in data) {
      final genus = Genus.fromJson(item);
      genuses.add(genus);
    }

    return genuses;
  }
}
