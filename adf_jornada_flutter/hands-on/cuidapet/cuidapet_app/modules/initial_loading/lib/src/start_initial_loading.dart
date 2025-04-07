import 'package:dependencies/dependencies.dart';
import 'features/features_initial_loading.dart';
import 'initial_loading_bindings.dart';

Future<void> startInitialLoading({
  required FirebaseOptions options,
}) async {
  print("inicio startInitialLoading!");
  await Service.to
      .initDependences(() async => InitialLoadingBindings().initBindings());
  print("dependencias inicializadas startInitialLoading!");

  List<Future<dynamic>> sevisesInit = [
    FeaturesInitialLoading.to.widgetsFlutterBindingService(),
    FeaturesInitialLoading.to.firebaseInitService(options: options),
  ];

  await Service.to.initServices(sevisesInit);
  print("startInitialLoading inicializadas!");
}
