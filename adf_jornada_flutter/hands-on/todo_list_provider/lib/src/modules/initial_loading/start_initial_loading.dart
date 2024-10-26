import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import 'features/features_initial_loading.dart';
import 'initial_loading_bindings.dart';

Future<void> startInitialLoading({
  required FirebaseOptions options,
}) async {
  await Service.to
      .initDependences(() async => InitialLoadingBindings().initBindings());

  List<Future<dynamic>> initialLoading = [
    FeaturesInitialLoading.to.widgetsFlutterBindingService(),
    FeaturesInitialLoading.to.firebaseInitService(options: options),
  ];
  await Service.to.initServices(initialLoading);
  Logger().i("Initial Loading Iniciados...");
}
