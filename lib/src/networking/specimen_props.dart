import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plants_app/src/models/genus.dart';

import 'package:plants_app/src/models/plant_specimen.dart';
import 'package:plants_app/src/models/status.dart';
import 'package:plants_app/src/networking/urls.dart';
import 'package:plants_app/src/shared/preferences.dart';
import 'package:plants_app/src/utils/utils.dart';

final prefs = UserPreferences();

class SpecimenPropsNetwork {
  _getData(String url) async {
    final res = await http.get(
      url,
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
