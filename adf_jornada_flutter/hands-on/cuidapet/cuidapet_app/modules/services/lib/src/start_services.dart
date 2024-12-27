import 'package:dependencies/dependencies.dart';
import 'service_bindings.dart';

Future<void> startServices() async {
  print("inicio dos serviços");
  await Service.to
      .initDependences(() async => ServiceBindings().initBindings());
  print("serviços instanciados");
  
  List<Future<dynamic>> sevisesInit = [
    FeaturesServicePresenter.to.externalStorageService(),
    FeaturesServicePresenter.to.authService(),
    FeaturesServicePresenter.to.remoteConfigService(),
  ];
  await Service.to.initServices(sevisesInit);
  print("serviços iniciados");
}
