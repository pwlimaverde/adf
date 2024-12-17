import 'package:dependencies/dependencies.dart';

import 'ui/login/login_module.dart';
import 'ui/splash/splash_page.dart';

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
    i.addLazySingleton(AuthStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => SplashPage(authStore: Modular.get()));
    r.module('/login', module: LoginModule());
  }
}
