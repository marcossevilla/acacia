import 'plant_family.dart';

class Species {
  int id;
  Family family;
  Family genus;
  String commonName;
  String scientificName;
  String description;
  dynamic photo;
  String type;

  Species({
    this.id,
    this.family,
    this.genus,
    this.commonName,
    this.scientificName,
    this.description,
    this.photo,
    this.type,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        id: json["id"],
        family: Family.fromJson(json["family"]),
        genus: Family.fromJson(json["genus"]),
        commonName: json["common_name"],
        scientificName: json["scientific_name"],
        description: json["description"],
        photo: json["photo"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "family": family.toJson(),
        "genus": genus.toJson(),
        "common_name": commonName,
        "scientific_name": scientificName,
        "description": description,
        "photo": photo,
        "type": type,
      };
}
