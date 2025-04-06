import 'package:dependencies/dependencies.dart';
import 'service_bindings.dart';

Future<void> startServices() async {
  print("inicio dos serviços");
  await Service.to
      .initDependences(() async => ServiceBindings().initBindings());
  print("serviços instanciados");
  
  List<Future<dynamic>> sevisesInit = [
    FeaturesServicePresenter.to.externalStorageService(),
    FeaturesServicePresenter.to.localStorageService(),
    FeaturesServicePresenter.to.authService(),
    FeaturesServicePresenter.to.remoteConfigService(),
    FeaturesServicePresenter.to.restClientCuidaPetApiService(),
    FeaturesServicePresenter.to.appLoggerService(),
  ];
  await Service.to.initServices(sevisesInit);
  print("serviços iniciados");
}
