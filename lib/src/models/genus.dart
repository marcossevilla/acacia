import 'package:plants_app/src/models/plant_family.dart';

class Genus {
  int id;
  String name;
  Family family;
  String type;

  Genus({this.id, this.name, this.family, this.type});

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        id: json['id'],
        name: json["name"],
        family: Family.fromJson(json["family"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'family': family.toJson(),
        'type': type,
      };
}
