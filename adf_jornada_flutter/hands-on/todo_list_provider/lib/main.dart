import 'package:flutter/material.dart';
import 'src/app_widget.dart';
import 'src/app_widget_animation.dart';
import 'src/modules/core/utils/firebase_options.dart';
import 'src/modules/sevices/start_services.dart';

void main() async {
  runApp(
    const AppWidgetAnimation(),
  );
  await startServices(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppWidget());
}
