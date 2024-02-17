import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_module.dart';
import 'modules/core/database/sqlite/sqlite_adm_connection.dart';
import 'modules/core/ui/ui_config.dart';


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
      providers: AppModule().aplicationsBindings,
      child: MaterialApp(
        title: 'Todo List Provider',
        debugShowCheckedModeBanner: false,
        theme: UiConfig.theme,
        routes: AppModule().routes,
      ),
    );
  }
}
