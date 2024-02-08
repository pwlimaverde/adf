import 'dart:convert';

import 'package:return_success_or_error/return_success_or_error.dart';

import 'city.dart';
import 'phone.dart';

final class Address {
  final String street;
  final int number;
  final String zipCode;
  final City city;
  final Phone phone;
  Address({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'number': number,
      'zipCode': zipCode,
      'city': city.toMap(),
      'phone': phone.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Address.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'street': String street,
        'number': int number,
        'zipCode': String zipCode,
        'city': Map<String, dynamic> city,
        'phone': Map<String, dynamic> phone,
      } =>
        Address(
          street: street,
          number: number,
          zipCode: zipCode,
          city: City.fromMap(city),
          phone: Phone.fromMap(phone),
        ),
      _ => throw ErrorGeneric(message: "Invalid Adress Map!"),
    };
  }

  factory Address.fromJson(String json) => Address.fromMap(jsonDecode(json));
}
