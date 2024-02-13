import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import 'todo_list_page.dart';

abstract base class Module {
  final Map<String, WidgetBuilder> _routes;
  final List<SingleChildWidget>? _bindings;

  Module({
    required Map<String, WidgetBuilder> routes,
    List<SingleChildWidget>? bindings,
  })  : _routes = routes,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routes {
    return _bindings != null
        ? _routes.map(
            (key, pageBuilder) => MapEntry(
              key,
              (_) => TodoListPage(
                bindings: _bindings,
                page: pageBuilder,
              ),
            ),
          )
        : _routes;
  }
}
