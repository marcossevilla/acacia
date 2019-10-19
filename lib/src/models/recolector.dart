class Recolector {
  String name;
  String photoURL;

  Recolector({this.name, this.photoURL});

  Recolector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photoURL = json['photo'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'photo': photoURL,
      };
}
