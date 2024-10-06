import 'package:provider/provider.dart';

import '../core/utils/module.dart';
import '../core/utils/routes.dart';
import 'ui/login/login_controller.dart';
import 'ui/login/login_page.dart';
import 'ui/register/register_controller.dart';
import 'ui/register/register_page.dart';

final class AuthModule extends Module {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => LoginController(),
            ),
            ChangeNotifierProvider(
              create: (_) => RegisterController(),
            )
          ],
          routes: {
            Routes.login.caminho: (context) => const LoginPage(),
            Routes.register.caminho: (context) => const RegisterPage(),
          },
        );
}
