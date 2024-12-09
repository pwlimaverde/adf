import 'package:dependencies/dependencies.dart';

import '../utils/typedefs.dart';

final class FeaturesServicePresenter {
  static FeaturesServicePresenter? _instance;

  late ExternalStorage externalStorage;
  late FirebaseAuth authInstance;

  final EsService _esService;
  final FAService _authService;

  FeaturesServicePresenter._({
    required EsService esService,
    required FAService authService,
  })  : _authService = authService,
        _esService = esService;

  factory FeaturesServicePresenter({
    required EsService esService,
    required FAService authService,
  }) {
    _instance ??= FeaturesServicePresenter._(
      esService: esService,
      authService: authService,
    );
    return _instance!;
  }

  Future<void> externalStorageService() async {
    final data = await _esService(
      NoParams(
        error: ErrorGeneric(
          message: "Erro  ao carregar instancia do firebase",
        ),
      ),
    );
    switch (data) {
      case SuccessReturn<ExternalStorage>():
        externalStorage = data.result;
      case ErrorReturn<ExternalStorage>():
        throw data.result.message;
    }
  }

  Future<Unit> authService() async {
    final data = await _authService(NoParams());
    switch (data) {
      case SuccessReturn<FirebaseAuth>():
        authInstance = data.result;
        return unit;
      case ErrorReturn<FirebaseAuth>():
        throw data.result.message;
    }
  }

  static FeaturesServicePresenter get to =>
      Get.find<FeaturesServicePresenter>();
}
