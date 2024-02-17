import 'package:provider/provider.dart';

import 'modules/auth/auth_module.dart';
import 'modules/core/database/sqlite/sqlite_connection.dart';
import 'modules/core/splash/splash_page.dart';

import 'modules/core/utils/module.dart';
import 'modules/core/utils/routes.dart';
import 'modules/home/home_module.dart';

final class AppModule extends Module {
  AppModule()
      : super(
          aplicationsBindings: [
            Provider(
              create: (_) => SqliteConnection(),
              lazy: false,
            ),
          ],
          routes: {
            Routes.initial.caminho: (context) => const SplashPage(),
            ...HomeModule().routes,
            ...AuthModule().routes,
          },
        );
}
