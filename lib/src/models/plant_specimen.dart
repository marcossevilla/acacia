import 'dart:convert';

import 'user.dart';
import 'genus.dart';
import 'status.dart';
import 'plant_family.dart';
import 'plant_species.dart';

PlantSpecimen plantSpecimenFromJson(String str) =>
    PlantSpecimen.fromJson(json.decode(str));

String plantSpecimenToJson(PlantSpecimen data) => json.encode(data.toJson());

class PlantSpecimen {
  Biostatus biostatus;
  dynamic photo;
  DateTime dateReceived;
  int numberOfSamples;
  String description;
  dynamic latitude;
  dynamic longitude;
  String location;
  bool complete;
  User user;
  Family family;
  Genus genus;
  Species species;
  Status status;
  Biostatus ecosystem;
  Biostatus recollectionAreaStatus;
  Biostatus country;
  City city;
  CountryState state;

  PlantSpecimen({
    this.biostatus,
    this.photo,
    this.dateReceived,
    this.numberOfSamples,
    this.description,
    this.latitude,
    this.longitude,
    this.location,
    this.complete,
    this.user,
    this.family,
    this.genus,
    this.species,
    this.status,
    this.ecosystem,
    this.recollectionAreaStatus,
    this.country,
    this.state,
    this.city,
  });

  factory PlantSpecimen.fromJson(Map<String, dynamic> json) => PlantSpecimen(
        biostatus: Biostatus.fromJson(json["biostatus"]),
        photo: json["photo"],
        dateReceived: DateTime.parse(json["date_received"]),
        numberOfSamples: json["number_of_samples"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        location: json["location"],
        complete: json["complete"],
        user: User.fromJson(json["user"]),
        family: Family.fromJson(json["family"]),
        genus: Genus.fromJson(json["genus"]),
        species: Species.fromJson(json["species"]),
        status: Status.fromJson(json["status"]),
        ecosystem: Biostatus.fromJson(json["ecosystem"]),
        recollectionAreaStatus:
            Biostatus.fromJson(json["recolection_area_status"]),
        country: Biostatus.fromJson(json["country"]),
        state: CountryState.fromJson(json["state"]),
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "biostatus": biostatus.toJson(),
        // "photo": photo,
        "date_received":
            "${dateReceived.year.toString().padLeft(4, '0')}-${dateReceived.month.toString().padLeft(2, '0')}-${dateReceived.day.toString().padLeft(2, '0')}",
        "number_of_samples": numberOfSamples,
        "description": description,
        // "latitude": latitude,
        // "longitude": longitude,
        "location": location,
        "complete": complete,
        "user": user.toJson(),
        "family": family.toJson(),
        "genus": genus.toJson(),
        "species": species.toJson(),
        "status": status.toJson(),
        "ecosystem": ecosystem.toJson(),
        "recolection_area_status": recollectionAreaStatus.toJson(),
        "country": country.toJson(),
        "state": state.toJson(),
        "city": city.toJson(),
      };
}

class Biostatus {
  int id;
  String name;

  Biostatus({
    this.id,
    this.name,
  });

  factory Biostatus.fromJson(Map<String, dynamic> json) => Biostatus(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class City {
  int id;
  CountryState state;
  String name;

  City({
    this.id,
    this.state,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        state: CountryState.fromJson(json["state"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state": state.toJson(),
        "name": name,
      };
}

class CountryState {
  int id;
  Biostatus country;
  String name;

  CountryState({
    this.id,
    this.country,
    this.name,
  });

  factory CountryState.fromJson(Map<String, dynamic> json) => CountryState(
        id: json["id"],
        country: Biostatus.fromJson(json["country"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country.toJson(),
        "name": name,
      };
}
