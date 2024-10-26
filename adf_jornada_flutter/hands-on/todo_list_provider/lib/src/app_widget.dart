import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_module.dart';

import 'modules/core/splash/splash_page.dart';
import 'modules/core/ui/ui_config.dart';
import 'modules/core/utils/todo_list_navigator.dart';
import 'modules/sevices/features/local_storage/datasource/sqlite/config/sqlite_adm_connection.dart';


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
        navigatorKey: TodoListNavigator.navigatorKey,
        routes: AppModule().routes,
        home: const SplashPage(),
      ),
    );
  }
}
