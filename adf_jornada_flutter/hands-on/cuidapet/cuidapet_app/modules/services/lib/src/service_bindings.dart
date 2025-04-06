import 'package:dependencies/dependencies.dart';

import 'features/external_storage/datasource/firebase/firebase_storage_datasource.dart';
import 'features/external_storage/domain/usecase/external_storage_usecase.dart';
import 'features/firebase_auth/domain/usecase/firebase_auth_usecase.dart';
import 'features/firebase_remote_config/domain/usecase/firebase_remote_config_usecase.dart';
import 'features/rest_client_cuidapet_api/datasource/dio/config/dio_connection.dart';
import 'features/rest_client_cuidapet_api/datasource/dio/dio_rest_client_datasource.dart';
import 'features/rest_client_cuidapet_api/domain/usecase/rest_client_cuidapet_api_usecase.dart';
import 'utils/typedefs.dart';

final autoInjector = AutoInjector();

final class ServiceBindings {
  void initBindings() {
    final bindings = AutoInjector(
      tag: 'service_bindings',
      on: (i) {
        i.addInstance<FirebaseFirestore>(FirebaseFirestore.instance);
        i.addInstance<FirebaseRemoteConfig>(FirebaseRemoteConfig.instance);
        i.addInstance<FirebaseStorage>(FirebaseStorage.instance);
        i.addInstance<FirebaseAuth>(FirebaseAuth.instance);
        i.add<DioConnection>(DioConnection.new);
        i.add<RCCServiceData>(DioRestClientDatasource.new);
        i.add<RCCService>(RestClientCuidapetApiUsecase.new);
        i.add<EsServiceData>(FirebaseStorageDatasource.new);
        i.add<EsService>(ExternalStorageUsecase.new);
        i.add<FAService>(FirebaseAuthUsecase.new);
        i.add<FRCService>(FirebaseRemoteConfigUsecase.new);
        i.commit();
      },
    );
    autoInjector.addInstance<FeaturesServicePresenter>(
      FeaturesServicePresenter(
        esService: bindings.get<EsService>(),
        authService: bindings.get<FAService>(),
        remoteConfigService: bindings.get<FRCService>(),
        restClientCuidaPetApiService: bindings.get<RCCService>(),
      ),
    );
    autoInjector.commit();
  }
}
