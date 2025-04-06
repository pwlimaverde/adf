import 'package:dependencies/dependencies.dart';

import '../service_bindings.dart';
import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';

final class FeaturesServicePresenter {
  static FeaturesServicePresenter? _instance;

  late ExternalStorage externalStorage;
  late RestClientCuidaPet restClientCuidaPet;
  late FirebaseAuth authInstance;
  late FirebaseRemoteConfig remoteConfigInstance;
  late String? urlLogo;

  final EsService _esService;
  final FAService _authService;
  final FRCService _remoteConfigService;
  final RCCService _restClientCuidaPetApiService;

  FeaturesServicePresenter._({
    required EsService esService,
    required FAService authService,
    required FRCService remoteConfigService,
    required RCCService restClientCuidaPetApiService,
  })  : _authService = authService,
        _remoteConfigService = remoteConfigService,
        _restClientCuidaPetApiService = restClientCuidaPetApiService,
        _esService = esService;

  factory FeaturesServicePresenter({
    required EsService esService,
    required FAService authService,
    required FRCService remoteConfigService,
    required RCCService restClientCuidaPetApiService,
  }) {
    _instance ??= FeaturesServicePresenter._(
      esService: esService,
      authService: authService,
      remoteConfigService: remoteConfigService,
      restClientCuidaPetApiService: restClientCuidaPetApiService
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
        await _setLogo();
      case ErrorReturn<ExternalStorage>():
        throw data.result.message;
    }
  }

  Future<void> restClientCuidaPetApiService() async {
    final data = await _restClientCuidaPetApiService(
      ParametrosRestClientResponse(
        error: RestClientResponseError(
          message: "Erro  ao carregar instancia do RestClientCuidaPet",
        ),
      ),
    );
    switch (data) {
      case SuccessReturn<RestClientCuidaPet>():
        restClientCuidaPet = data.result;
      case ErrorReturn<RestClientCuidaPet>():
        throw data.result.message;
    }
  }

  Future<void> _setLogo() async {
    urlLogo = await externalStorage.readUrlMidia('institucional/logo.png');
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

  Future<Unit> remoteConfigService() async {
    final data = await _remoteConfigService(NoParams());
    switch (data) {
      case SuccessReturn<FirebaseRemoteConfig>():
        remoteConfigInstance = data.result;
        return unit;
      case ErrorReturn<FirebaseRemoteConfig>():
        throw data.result.message;
    }
  }

  static FeaturesServicePresenter get to =>
      autoInjector.get<FeaturesServicePresenter>();
}
