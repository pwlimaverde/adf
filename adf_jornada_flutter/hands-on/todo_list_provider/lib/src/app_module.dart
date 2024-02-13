import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'modules/auth/auth_module.dart';
import 'modules/core/database/sqlite/sqlite_connection.dart';
import 'modules/core/splash/splash_page.dart';

import 'modules/core/utils/module.dart';
import 'modules/core/utils/routes.dart';
import 'modules/home/home_module.dart';

// final class AppModule{

//   final Map<String, Widget Function(BuildContext)> routes = {
//     Routes.initial.caminho: (context) => const SplashPage(),
//     ...HomeModule().routes,
//     ...AuthModule().routes,
//   };

//   final List<SingleChildWidget> aplicationsBindings = [
//     Provider(
//       create: (_) => SqliteConnection(),
//       lazy: false,
//     ),
//     Provider(
//       create: (_) => "Teste Provider ok",
//       lazy: false,
//     ),
//   ];
// }

final class AppModule extends Module {
  AppModule()
      : super(routes: {
          Routes.initial.caminho: (context) => const SplashPage(),
          ...HomeModule().routes,
          ...AuthModule().routes,
        });

  final List<SingleChildWidget> aplicationsBindings = [
    Provider(
      create: (_) => SqliteConnection(),
      lazy: false,
    ),
    Provider(
      create: (_) => "Teste Provider ok",
      lazy: false,
    ),
  ];
}
