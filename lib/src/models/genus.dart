import 'package:plants_app/src/models/plant_family.dart';

class Genus {
  String name;
  Family family;
  String type;

  Genus({this.name, this.family, this.type});

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        name: json["name"],
        family: Family.fromJson(json["family"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'family': family.toJson(),
        'type': type,
      };
}
