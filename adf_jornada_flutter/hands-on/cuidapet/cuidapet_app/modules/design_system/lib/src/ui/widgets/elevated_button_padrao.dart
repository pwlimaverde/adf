import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ElevatedButtonPadrao extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final double borderRadius;
  final double padding;
  final double labelSize;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? labelColor;


  const ElevatedButtonPadrao({
    super.key,
    required this.onPressed,
    required this.label,
    this.borderRadius = 15,
    this.backgroundColor,
    this.labelColor,
    this.labelSize = 15,
    this.padding = 10,
    this.width = double.infinity,
    this.height = 66,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? context.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            label,
            style: TextStyle(
              color: labelColor ?? Colors.white,
              fontSize: labelSize,
            ),
          ),
        ),
      ),
    );
  }
}
