import 'package:provider/provider.dart';

import '../core/utils/module.dart';
import '../core/utils/routes.dart';
import 'ui/home_controller.dart';
import 'ui/home_page.dart';

final class HomeModule extends Module {
  HomeModule()
      : super(
        bindings: [
            ChangeNotifierProvider(
              create: (_) => HomeController(),
            )
          ],
          routes: {
            Routes.home.caminho: (context) => const HomePage(),
          },
        );
}
