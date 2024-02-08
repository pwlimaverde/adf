import 'dart:convert';

import 'package:return_success_or_error/return_success_or_error.dart';

final class Products {
  final int id;
  final String name;
  Products({
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

  factory Products.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': int id,
        'name': String name,
      } =>
        Products(
          id: id,
          name: name,
        ),
      _ => throw ErrorGeneric(message: "Invalid Products Map!"),
    };
  }

  factory Products.fromJson(String json) => Products.fromMap(jsonDecode(json));
}
