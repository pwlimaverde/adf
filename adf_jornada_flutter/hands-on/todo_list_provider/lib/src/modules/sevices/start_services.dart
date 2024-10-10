import 'package:firebase_core/firebase_core.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import 'features/features_service_presenter.dart';
import 'services_bindings.dart';



Future<void> startServices({
  required FirebaseOptions options,
}) async {
  await Service.to
      .initDependences(() async => ServiceBindings().initBindings());

  List<Future<dynamic>> sevisesInit = [
    FeaturesServicePresenter.to.widgetsFlutterBindingService(),
    FeaturesServicePresenter.to.firebaseInitService(options: options),
    FeaturesServicePresenter.to.localStorageService(),
    FeaturesServicePresenter.to.googleSignInService(),
  ];


  await Service.to.initServices(sevisesInit);
  print("Serviços Iniciados...");
}
