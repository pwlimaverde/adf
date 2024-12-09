import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'src/app_module.dart';
import 'src/app_widget.dart';
import 'src/utils/firebase_options.dart';

void main() async {
  await startInitialLoading(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
