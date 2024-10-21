import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'package:return_success_or_error/return_success_or_error.dart';

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


  static FeaturesInitialLoading get to => GetIt.I.get<FeaturesInitialLoading>();
}
