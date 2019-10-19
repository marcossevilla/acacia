import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plants_app/src/models/recolector.dart';
import 'package:plants_app/src/networking/urls.dart';

class RecolectorNetwork {
  Future<List<Recolector>> getAllRecolectors() async {
    List<Recolector> recols = [];

    final res = await http.get('$baseURL/recolector/');

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      if (data == null) return [];

      for (var item in data['results']) {
        final rec = Recolector.fromJson(item);
        recols.add(rec);
      }
      return recols;
    } else {
      return recols;
    }
  }

  Future<Recolector> getRecolector(String name) async {
    final res = await http.get(
      '$baseURL/recolector/search_recolector/?name=$name',
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      Recolector rec = Recolector.fromJson(data);

      return rec;
    }

    return null;
  }
}
