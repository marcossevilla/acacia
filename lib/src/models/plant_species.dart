import 'package:plants_app/src/models/plant_family.dart';

class PlantSpecies {
  String commonName;
  String scientificName;
  PlantFamily family;
  String description;
  String photoURL;

  PlantSpecies(
    this.commonName,
    this.scientificName,
    this.family,
    this.description,
    this.photoURL,
  );

  PlantSpecies.fromJson(Map<String, dynamic> json) {
    commonName = json['common_name'];
    scientificName = json['scientific_name'];
    family = PlantFamily.fromJson(json['family']);
    description = json['description'];
    photoURL = json['photo'];
  }

  Map<String, dynamic> toJson() => {
        'common_name': commonName,
        'scientific_name': scientificName,
        'family': family.toJson(),
        'description': description,
        'photo': photoURL,
      };
}
