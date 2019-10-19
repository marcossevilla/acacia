class Status {
  String name;

  Status({this.name});

  Status.fromJson(Map<String, dynamic> json) : name = json['status_name'];

  Map<String, dynamic> toJson() => {'status_name': name};
}
