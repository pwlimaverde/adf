import 'package:dependencies/dependencies.dart';


///Usecase with external Datasource call
final class FirebaseRemoteConfigUsecase
    extends UsecaseBase<FirebaseRemoteConfig> {
  final FirebaseRemoteConfig _firebaseRemoteConfig;

  FirebaseRemoteConfigUsecase(
    FirebaseRemoteConfig firebaseRemoteConfig,
  ) : _firebaseRemoteConfig = firebaseRemoteConfig;

  @override
  Future<ReturnSuccessOrError<FirebaseRemoteConfig>> call(
      NoParams parameters) async {
    await _firebaseRemoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 30),
      ),
    );
    await _firebaseRemoteConfig.fetchAndActivate();
    return SuccessReturn(
      success: _firebaseRemoteConfig,
    );
  }
}
