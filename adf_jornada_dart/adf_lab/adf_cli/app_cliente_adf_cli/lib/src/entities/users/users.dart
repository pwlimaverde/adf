import 'dart:convert';

import 'package:return_success_or_error/return_success_or_error.dart';

final class Users {
  final int id;
  final String name;
  final String email;
  final String password;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Users.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': int id,
        'name': String name,
        'email': String email,
        'password': String password,
      } =>
        Users(
          id: id,
          name: name,
          email: email,
          password: password,
        ),
        _=> throw ErrorGeneric(message: "Invalid users Map!")
    };
  }

  factory Users.fromJson(String json) => Users.fromMap(jsonDecode(json));
}
