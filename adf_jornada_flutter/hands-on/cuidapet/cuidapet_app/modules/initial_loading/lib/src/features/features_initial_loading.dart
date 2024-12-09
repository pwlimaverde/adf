import 'package:dependencies/dependencies.dart';

import '../initial_loading_bindings.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';

final class FeaturesInitialLoading {
  static FeaturesInitialLoading? _instance;

  final FbService _fbService;
  final WidService _widService;

  FeaturesInitialLoading._({
    required FbService fbService,
    required WidService widService,
  })  : _widService = widService,
        _fbService = fbService;

  factory FeaturesInitialLoading({

    required FbService fbService,
    required WidService widService,
  }) {
    _instance ??= FeaturesInitialLoading._(
      fbService: fbService,
      widService: widService,
    );
    return _instance!;
  }

  Future<Unit> firebaseInitService({required FirebaseOptions options}) async {
    final data = await _fbService(ParametrosFirebaseInit(
        options: options,
        error: ErrorGeneric(
          message: "Erro ao inializar firebase",
        )));
    switch (data) {
      case SuccessReturn<Unit>():
        return unit;
      case ErrorReturn<Unit>():
        throw data.result.message;
    }
  }

  Future<Unit> widgetsFlutterBindingService() async {
    final data = await _widService(NoParams());
    switch (data) {
      case SuccessReturn<Unit>():
        return unit;
      case ErrorReturn<Unit>():
        throw data.result.message;
    }
  }

  static FeaturesInitialLoading get to => autoInjector.get<FeaturesInitialLoading>();
}
