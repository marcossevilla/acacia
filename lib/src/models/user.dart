class User {
  dynamic profile;
  DateTime lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  String name;
  List<int> groups;
  List<String> user_permissions;

  User({
    this.profile,
    this.lastLogin,
    this.isSuperuser,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.name,
    this.groups,
    this.user_permissions
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        profile: json["profile"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        name: json["name"],
        groups: List<int>.from(json["groups"].map((x) => x)),
        user_permissions: List<String>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "profile": profile,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "name": name,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(user_permissions.map((x) => x)),
      };
}
