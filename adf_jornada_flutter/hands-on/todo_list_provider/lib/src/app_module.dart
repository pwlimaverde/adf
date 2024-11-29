import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'modules/auth/auth_module.dart';

import 'modules/core/auth_listen/auth_listen.dart';
import 'modules/core/utils/module.dart';
import 'modules/home/home_module.dart';
import 'modules/sevices/features/features_service_presenter.dart';
import 'modules/tasks/tasks_module.dart';

final class AppModule extends Module {
  AppModule()
      : super(
          aplicationsBindings: [
            Provider<FeaturesServicePresenter>(
              create: (_) => GetIt.I.get<FeaturesServicePresenter>(),
              lazy: false,
            ),
            ChangeNotifierProvider(
              create: (context) => AuthListen(context.read<FeaturesServicePresenter>())..loadListen(),
              lazy: false,
            ),
          ],
          routes: {
            ...HomeModule().routes,
            ...AuthModule().routes,
            ...TasksModule().routes,
          },
        );
}
