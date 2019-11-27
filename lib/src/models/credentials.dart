class Credentials {
  String username;
  String password;

  Credentials({
    this.username,
    this.password
  });

  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password
  };
}