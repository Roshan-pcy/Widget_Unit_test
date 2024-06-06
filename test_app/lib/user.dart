class User {
  final int id;
  final String name;
  final String email;
  User({required this.name, required this.email, required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], email: json['email'], id: json['id']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map.addAll({'id': id});
    map.addAll({'name': name});

    map.addAll({'email': email});

    return map;
  }
}
