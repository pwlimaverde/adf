import 'package:flutter/material.dart';

final class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      modules: AppModule().routes,
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          navigatorObservers: [flutterGetItNavObserver],
          routes: routes,
          title: 'Example App Flutter Get',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
