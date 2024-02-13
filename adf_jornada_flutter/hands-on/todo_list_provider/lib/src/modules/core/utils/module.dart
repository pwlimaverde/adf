import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import 'provider_page.dart';

abstract base class Module {
  final Map<String, WidgetBuilder> _routes;
  final List<SingleChildWidget>? _bindings;
  final List<SingleChildWidget>? _aplicationsBindings;

  Module({
    required Map<String, WidgetBuilder> routes,
    List<SingleChildWidget>? bindings,
    List<SingleChildWidget>? aplicationsBindings,
  })  : _routes = routes,
        _bindings = bindings,
        _aplicationsBindings = aplicationsBindings;

  Map<String, WidgetBuilder> get routes {
    return _bindings != null
        ? _routes.map(
            (key, pageBuilder) => MapEntry(
              key,
              (_) => ProviderPage(
                bindings: _bindings,
                page: pageBuilder,
              ),
            ),
          )
        : _routes;
  }

  List<SingleChildWidget> get aplicationsBindings => _aplicationsBindings??[];
}
