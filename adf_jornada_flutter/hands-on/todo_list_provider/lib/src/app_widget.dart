import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_module.dart';
import 'modules/core/splash/splash_page.dart';

final class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppModule().routes,
      child: MaterialApp(
        title: 'Todo List Provider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
