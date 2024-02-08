import 'dart:convert';

import 'package:return_success_or_error/return_success_or_error.dart';

final class Phone {
  final int ddd;
  final String phone;
  Phone({
    required this.ddd,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'phone': phone,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Phone.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'ddd': int ddd,
        'phone': String phone,
      } =>
        Phone(
          ddd: ddd,
          phone: phone,
        ),
      _ => throw ErrorGeneric(message: "Invalid Phone Map"),
    };
  }

  factory Phone.fromJson(String json) => Phone.fromMap(jsonDecode(json));
}
