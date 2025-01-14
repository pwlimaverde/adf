import 'package:logger/logger.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import 'features/features_service_presenter.dart';
import 'services_bindings.dart';

Future<void> startServices() async {
  await Service.to
      .initDependences(() => ServiceBindings().initBindings());
  List<Future<dynamic>> sevisesInit = [
    FeaturesServicePresenter.to.externalStorageService(),
    FeaturesServicePresenter.to.googleSignInService(),
    FeaturesServicePresenter.to.authInitService(),
    FeaturesServicePresenter.to.currentUserService(),
    FeaturesServicePresenter.to.firebaseStorageInitService(),
  ];

  await Service.to.initServices(sevisesInit);
  Logger().i("Serviços Iniciados...");
}
