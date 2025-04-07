import 'package:dependencies/dependencies.dart';

class AppModule extends Module {
  @override
   List<Module> get imports => [
    CoreModule(),
    AuthModule(),
   ];

  @override
  void routes(r) {
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
