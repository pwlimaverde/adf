import 'dart:convert';

import 'package:return_success_or_error/return_success_or_error.dart';

final class Course {
  final int id;
  final String name;
  final bool isStudent;
  Course({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isStudent': isStudent,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Course.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': int id,
        'name': String name,
        'isStudent': bool isStudent,
      } =>
        Course(
          id: id,
          name: name,
          isStudent: isStudent,
        ),
      _ => throw ErrorGeneric(message: "Invalid Course Map"),
    };
  }

  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));
}
