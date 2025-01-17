import 'package:flutter/material.dart';
import 'src/app_widget.dart';
import 'src/modules/core/utils/firebase_options.dart';
import 'src/modules/initial_loading/start_initial_loading.dart';
import 'src/modules/sevices/start_services.dart';

void main() async {
  await startInitialLoading(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await startServices();
  runApp(const AppWidget());
}
