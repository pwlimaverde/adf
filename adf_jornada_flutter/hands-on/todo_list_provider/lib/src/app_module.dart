import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'modules/auth/auth_module.dart';
import 'modules/core/database/sqlite/sqlite_connection.dart';
import 'modules/core/splash/splash_page.dart';

import 'modules/core/utils/module.dart';
import 'modules/core/utils/routes.dart';
import 'modules/home/home_module.dart';
import 'modules/sevices/features/features_service_presenter.dart';

final class AppModule extends Module {
  AppModule()
      : super(
          aplicationsBindings: [
            Provider(
              create: (_) => SqliteConnection(),
              lazy: false,
            ),
            Provider<FeaturesServicePresenter>(
              create: (_) => GetIt.I.get<FeaturesServicePresenter>(),
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
