import 'dart:convert';
import 'package:http/http.dart' as http;

import 'base_network.dart';
import '../models/genus.dart';
import '../models/status.dart';
import '../models/plant_specimen.dart';
import '../models/nested_specimen.dart';
import '../shared/preferences.dart';

final prefs = UserPreferences();

class SpecimenNetwork {
  // Basic structure of a get
  _getData(String url) async {
    final res = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'Cookie': '${prefs.token};${prefs.tokenRefresh}',
      },
    );

    refreshTokens(res);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      if (data == null) return [];
      return data;
    } else {
      return [];
    }
  }

  /*
    Specimen methods
  */

  Future<List<PlantSpecimen>> getAllSpecimens() async {
    List<PlantSpecimen> specimens = List();

    var data = await _getData('$baseURL/plant_specimen/');

    for (var item in data) {
      final specimen = PlantSpecimen.fromJson(item);
      specimens.add(specimen);
    }
    return specimens;
  }

  Future<bool> postSpecimen(NestedSpecimen specimen) async {
    final res = await http.post(
      '$baseURL/plant_specimen/',
      body: jsonEncode(specimen.toJson()),
      headers: {
        "Content-Type": "application/json",
        'Cookie': '${prefs.token};${prefs.tokenRefresh}',
      },
    );

    refreshTokens(res);

    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  /*
    Specimen dependencies methods
  */

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

  Future<List<Biostatus>> getEcosystems() async {
    List<Biostatus> ecos = List();

    var data = await _getData('$baseURL/ecosystem');

    for (var item in data) {
      final eco = Biostatus.fromJson(item);
      ecos.add(eco);
    }
    return ecos;
  }

  Future<List<Biostatus>> getRecollections() async {
    List<Biostatus> recollections = List();

    var data = await _getData('$baseURL/recolection_area_status');

    for (var item in data) {
      final rec = Biostatus.fromJson(item);
      recollections.add(rec);
    }
    return recollections;
  }

  Future<List<Biostatus>> getCountries() async {
    List<Biostatus> countries = List();

    var data = await _getData('$baseURL/country');

    for (var item in data) {
      final country = Biostatus.fromJson(item);
      countries.add(country);
    }
    return countries;
  }

  Future<List<CountryState>> getStates() async {
    List<CountryState> states = List();

    var data = await _getData('$baseURL/state');

    for (var item in data) {
      final state = CountryState.fromJson(item);
      states.add(state);
    }
    return states;
  }

  Future<List<City>> getCities() async {
    List<City> cities = List();

    var data = await _getData('$baseURL/city');

    for (var item in data) {
      final city = City.fromJson(item);
      cities.add(city);
    }
    return cities;
  }

  Future<List<Status>> getStatus() async {
    List<Status> status = List();

    var data = await _getData('$baseURL/status');

    for (var item in data) {
      final stat = Status.fromJson(item);
      status.add(stat);
    }
    return status;
  }
}
