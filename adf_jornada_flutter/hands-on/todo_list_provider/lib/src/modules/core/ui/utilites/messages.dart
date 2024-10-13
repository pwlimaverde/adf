import 'package:flutter/material.dart';

enum MessagesType {
  success,
  error,
  warning,
  info,
}

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showMessage(
    String message,
    MessagesType type,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: type == MessagesType.error
            ? Colors.redAccent
            : type == MessagesType.success
                ? Colors.greenAccent
                : type == MessagesType.warning
                    ? Colors.orangeAccent
                    : Colors.blueAccent,
      ),
    );
  }
}
