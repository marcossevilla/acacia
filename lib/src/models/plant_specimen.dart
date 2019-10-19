import 'package:plants_app/src/models/plant_family.dart';
import 'package:plants_app/src/models/plant_species.dart';
import 'package:plants_app/src/models/recolector.dart';
import 'package:plants_app/src/models/status.dart';

class PlantSpecimen {
  Recolector recolector;
  String photoURL;
  String dateReceived;
  Status status;
  PlantSpecies species;
  PlantFamily family;

  PlantSpecimen(
    this.recolector,
    this.photoURL,
    this.dateReceived,
    this.status,
    this.species,
    this.family,
  );

  PlantSpecimen.fromJson(Map<String, dynamic> json) {
    recolector = Recolector.fromJson(json['recolector']);
    photoURL = json['photo'];
    dateReceived = json['date_received'];
    status = Status.fromJson(json['status']);
    species = PlantSpecies.fromJson(json['plant_species']);
    family = PlantFamily.fromJson(json['plant_family']);
  }

  Map<String, dynamic> toJson() => {
        'recolector': recolector.toJson(),
        'photo': photoURL,
        'date_received': dateReceived,
        'status': status.toJson(),
        'plant_species': species.toJson(),
        'plant_family': family.toJson(),
      };
}
