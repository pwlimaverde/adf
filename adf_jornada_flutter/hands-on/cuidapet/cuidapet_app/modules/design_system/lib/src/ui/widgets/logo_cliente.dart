import 'package:flutter/material.dart';

class LogoCliente extends StatelessWidget {
  final String _urlLogoCliente;
  final String? _label;
  const LogoCliente({
    super.key,
    required String urlLogoCliente,
    String? label,
  })  : _urlLogoCliente = urlLogoCliente,
        _label = label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          _urlLogoCliente,
          height: 200,
        ),
        Text(
          _label ?? '',
          style: Theme.of(context).textTheme.headlineLarge,
        )
      ],
    );
  }
}
