
import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final int? id;
  String username;
  String password;

  Users({
    this.id,
    required this.username,
    required this.password,

  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    id: json["id"],
    username: json["username"],
    password: json["password"],

  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "username": username,
    "password": password,

  };
}
