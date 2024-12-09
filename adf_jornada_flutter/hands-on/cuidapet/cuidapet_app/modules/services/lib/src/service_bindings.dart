import 'package:dependencies/dependencies.dart';

import 'features/external_storage/datasource/firebase/firebase_storage_datasource.dart';
import 'features/external_storage/domain/usecase/external_storage_usecase.dart';
import 'features/firebase_auth/domain/usecase/firebase_auth_usecase.dart';
import 'utils/typedefs.dart';

final class ServiceBindings implements Binding {
  @override
  List<Bind> dependencies() => [
        Bind.put<FirebaseFirestore>(
          FirebaseFirestore.instance,
          permanent: true,
        ),
        Bind.put<FirebaseStorage>(
          FirebaseStorage.instance,
          permanent: true,
        ),
        Bind.lazyPut<EsServiceData>(
          () => FirebaseStorageDatasource(
            firebaseFirestore: Get.find<FirebaseFirestore>(),
            firebaseStorage: Get.find<FirebaseStorage>(),
          ),
        ),
        Bind.lazyPut<EsService>(
          () => ExternalStorageUsecase(
            Get.find<EsServiceData>(),
          ),
        ),
        Bind.put<FirebaseAuth>(
          FirebaseAuth.instance,
          permanent: true,
        ),
        Bind.lazyPut<FAService>(
          () => FirebaseAuthUsecase(
            Get.find<FirebaseAuth>(),
          ),
        ),
        Bind.put<FeaturesServicePresenter>(
          FeaturesServicePresenter(
            esService: Get.find<EsService>(),
            authService: Get.find<FAService>(),
          ),
          permanent: true,
        ),
      ];
}
