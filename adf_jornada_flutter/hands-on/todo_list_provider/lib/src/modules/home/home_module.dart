import '../core/utils/module.dart';
import '../core/utils/routes.dart';
import 'ui/home_page.dart';

final class HomeModule extends Module {
  HomeModule()
      : super(
          routes: {
            Routes.home.caminho: (context) => const HomePage(),
          },
        );
}
