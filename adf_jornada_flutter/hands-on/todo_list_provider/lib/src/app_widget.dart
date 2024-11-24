import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'app_module.dart';

import 'modules/core/splash/splash_page.dart';
import 'modules/core/ui/ui_config.dart';
import 'modules/core/utils/todo_list_navigator.dart';


final class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppModule().aplicationsBindings,
      child: MaterialApp(
        title: 'Todo List Provider',
        debugShowCheckedModeBanner: false,
        theme: UiConfig.theme,
        navigatorKey: TodoListNavigator.navigatorKey,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        routes: AppModule().routes,
        home: const SplashPage(),
      ),
    );
  }
}
