// To parse this JSON data, do
//
//     final nestedSpecimen = nestedSpecimenFromJson(jsonString);

import 'dart:convert';

NestedSpecimen nestedSpecimenFromJson(String str) =>
    NestedSpecimen.fromJson(json.decode(str));

String nestedSpecimenToJson(NestedSpecimen data) => json.encode(data.toJson());

class NestedSpecimen {
  int biostatus;
  dynamic photo;
  DateTime dateReceived;
  int numberOfSamples;
  String description;
  dynamic latitude;
  dynamic longitude;
  String location;
  bool complete;
  int user;
  int family;
  int genus;
  int species;
  int status;
  int ecosystem;
  int recolectionAreaStatus;
  int country;
  int state;
  int city;

  NestedSpecimen({
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
    this.recolectionAreaStatus,
    this.country,
    this.state,
    this.city,
  });

  factory NestedSpecimen.fromJson(Map<String, dynamic> json) => NestedSpecimen(
        biostatus: json["biostatus"],
        photo: json["photo"],
        dateReceived: DateTime.parse(json["date_received"]),
        numberOfSamples: json["number_of_samples"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        location: json["location"],
        complete: json["complete"],
        user: json["user"],
        family: json["family"],
        genus: json["genus"],
        species: json["species"],
        status: json["status"],
        ecosystem: json["ecosystem"],
        recolectionAreaStatus: json["recolection_area_status"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "biostatus": biostatus,
        "photo": photo,
        "date_received":
            "${dateReceived.year.toString().padLeft(4, '0')}-${dateReceived.month.toString().padLeft(2, '0')}-${dateReceived.day.toString().padLeft(2, '0')}",
        "number_of_samples": numberOfSamples,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
        "location": location,
        "complete": complete,
        "user": user,
        "family": family,
        "genus": genus,
        "species": species,
        "status": status,
        "ecosystem": ecosystem,
        "recolection_area_status": recolectionAreaStatus,
        "country": country,
        "state": state,
        "city": city,
      };
}
