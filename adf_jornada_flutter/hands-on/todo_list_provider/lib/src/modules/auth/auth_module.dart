import 'package:provider/provider.dart';

import '../core/utils/module.dart';
import '../core/utils/routes.dart';
import 'ui/login/login_controller.dart';
import 'ui/login/login_page.dart';

final class AuthModule extends Module {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => LoginController(),
            )
          ],
          routes: {
            Routes.login.caminho: (context) => const LoginPage(),
          },
        );
}
