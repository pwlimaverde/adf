import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'todo_list_page.dart';

abstract base class Module {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;
  Module({
    required Map<String, WidgetBuilder> routers,
    List<SingleChildWidget>? bindings,
  })  : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => TodoListPage(
          bindings: _bindings,
          page: pageBuilder,
        ),
      ),
    );
  }

  List<SingleChildWidget> get bindings => _bindings??[Provider(create: (_) => Object())];

}
