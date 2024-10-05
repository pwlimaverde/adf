import 'package:flutter/material.dart';

class ElevatedButtonPadrao extends StatelessWidget {
  final void Function() onPressed;
  final String label;

  const ElevatedButtonPadrao(
      {super.key, required this.onPressed, required this.label});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label, style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
