import 'dart:convert';

import 'package:return_success_or_error/return_success_or_error.dart';

final class City {
  final int id;
  final String name;
  City({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory City.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': int id,
        'name': String name,
      } =>
        City(
          id: id,
          name: name,
        ),
      _ => throw ErrorGeneric(message: "Invalid City Map!"),
    };
  }

  factory City.fromJson(String json) => City.fromMap(jsonDecode(json));
}
