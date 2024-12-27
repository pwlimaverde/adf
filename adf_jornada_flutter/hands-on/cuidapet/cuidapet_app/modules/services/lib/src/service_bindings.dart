import 'package:dependencies/dependencies.dart';

import 'features/external_storage/datasource/firebase/firebase_storage_datasource.dart';
import 'features/external_storage/domain/usecase/external_storage_usecase.dart';
import 'features/firebase_auth/domain/usecase/firebase_auth_usecase.dart';
import 'features/firebase_remote_config/domain/usecase/firebase_remote_config_usecase.dart';
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
      ),
    );
    autoInjector.commit();
  }
}
