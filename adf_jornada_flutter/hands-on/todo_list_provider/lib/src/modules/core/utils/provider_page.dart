import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderPage extends StatelessWidget {
  final WidgetBuilder _page;
  final List<SingleChildWidget> _bindings;

  const ProviderPage(
      {super.key,
      required List<SingleChildWidget> bindings,
      required WidgetBuilder page})
      : _bindings = bindings,
        _page = page;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _bindings,
      child: Builder(
        builder: (context) => _page(context),
      ),
    );
  }
}
