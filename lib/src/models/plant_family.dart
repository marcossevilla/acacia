class Family {
  int id;
  String name;
  String type;
  Family family;

  Family({
    this.id,
    this.name,
    this.type,
    this.family,
  });

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        family: json["family"] == null ? null : Family.fromJson(json["family"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "family": family == null ? null : family.toJson(),
      };
}
