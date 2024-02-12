import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_module.dart';
import 'modules/auth/auth_module.dart';
import 'modules/core/database/sqlite/sqlite_adm_connection.dart';
import 'modules/core/database/sqlite/sqlite_connection.dart';
import 'modules/core/splash/splash_page.dart';

final class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppModule().bindings,
      child: MaterialApp(
        title: 'Todo List Provider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(),
        routes: {
          ...AuthModule().routers,
        },
      ),
    );
  }
}
