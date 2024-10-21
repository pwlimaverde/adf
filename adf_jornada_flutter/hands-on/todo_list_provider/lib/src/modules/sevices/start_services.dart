import 'package:return_success_or_error/return_success_or_error.dart';

import 'features/features_service_presenter.dart';
import 'services_bindings.dart';

Future<void> startServices() async {
  await Service.to
      .initDependences(() => ServiceBindings().initBindings());
  List<Future<dynamic>> sevisesInit = [
    FeaturesServicePresenter.to.localStorageService(),
    FeaturesServicePresenter.to.externalStorageService(),
    FeaturesServicePresenter.to.googleSignInService(),
    FeaturesServicePresenter.to.authInitService(),
    FeaturesServicePresenter.to.currentAccountService(),
    // FeaturesServicePresenter.to.currentUserService(),
    FeaturesServicePresenter.to.siginOutService(),
  ];

  await Service.to.initServices(sevisesInit);
  print("Serviços Iniciados...");
}
