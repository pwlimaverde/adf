import 'dart:convert';

import 'package:return_success_or_error/return_success_or_error.dart';

import 'address/address.dart';
import 'courses/course.dart';

final class Students {
  final int id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Course> courses;
  final Address address;
  Students({
    required this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'nameCourses': nameCourses,
      'courses': courses.map((course) => course.toMap()).toList(),
      'address': address.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }

    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory Students.fromMap(Map<String, dynamic> map) {
 
    return switch (map) {
      {
        'id': int id,
        'name': String name,
        'nameCourses': List nameCourses,
        'courses': List courses,
        'address': Map<String, dynamic> address,
      } =>
        Students(
          id: id,
          name: name,
          age: map['age'],
          nameCourses: List<String>.from(nameCourses),
          courses: courses.map<Course>((course) => Course.fromMap(course)).toList(),
          address: Address.fromMap(address),
        ),
        _=> throw ErrorGeneric(message: "Invalid Student Map!"),
    };
  }

  factory Students.fromJson(String json) => Students.fromMap(jsonDecode(json));
}
