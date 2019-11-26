class User {
  int id;
  dynamic profile;
  DateTime lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  String name;
  List<int> groups;

  User({
    this.id,
    this.profile,
    this.lastLogin,
    this.isSuperuser,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.name,
    this.groups,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        profile: json["profile"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        name: json["name"],
        groups: List<int>.from(json["groups"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profile": profile,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "name": name,
        "groups": List<dynamic>.from(groups.map((x) => x)),
      };
}
