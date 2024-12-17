import 'package:dependencies/dependencies.dart';

import 'ui/login_page.dart';

class LoginModule extends Module {
  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const LoginPage());
  }
}
