import 'package:dependencies/dependencies.dart';

import 'ui/register_page.dart';

class RegisterModule extends Module {
  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const RegisterPage());
  }
}
