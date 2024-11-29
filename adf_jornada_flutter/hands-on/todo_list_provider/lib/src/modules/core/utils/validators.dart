import 'package:flutter/material.dart';

class Validators {
  Validators._();
  static FormFieldValidator compare(
    TextEditingController? valueEc,
    String message,
  ) {
    return (value) {
      final valueCompare = valueEc?.text ?? "";
      if (value == null || (value != null && value != valueCompare)) {
        return message;
      }
      return null;
    };
  }
}
