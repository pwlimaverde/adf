

import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/external_storage/datasource/firebase/firebase_storage_datasource.dart';
import 'features/external_storage/domain/usecase/external_storage_usecase.dart';
import 'features/features_service_presenter.dart';
import 'features/firebase_init/datasource/firebase_init_datasource.dart';
import 'features/firebase_init/domain/usecase/firebase_init_usecase.dart';
import 'features/google_sign_in/domain/usecase/google_sign_in_usecase.dart';
import 'features/local_storage/datasource/hive/hive_storage_datasource.dart';
import 'features/local_storage/datasource/sqlite/sqlite_storage_datasource.dart';
import 'features/local_storage/domain/usecase/local_storage_usecase.dart';
import 'features/widgets_flutter_binding/datasource/widgets_flutter_binding_datasource.dart';
import 'features/widgets_flutter_binding/domain/usecase/widgets_flutter_binding_usecase.dart';
import 'utils/scopes.dart';
import 'utils/typedefs.dart';

final class ServiceBindings {
  void initBindings() {
    final getIt = GetIt.I;

    getIt.registerSingleton<GoogleSignIn>(
      GoogleSignIn(scopes: scopes),
    );

    getIt.registerFactory<SignInService>(
      () => GoogleSignInUsecase(
        getIt.get<GoogleSignIn>(),
      ),
    );
    getIt.registerFactory<EsServiceData>(
      () => FirebaseStorageDatasource(),
    );
    getIt.registerFactory<EsService>(
      () => ExternalStorageUsecase(
        getIt.get<EsServiceData>(),
      ),
    );
    getIt.registerFactory<LsServiceData>(
      () => SqliteStorageDatasource(),
    );
    getIt.registerFactory<LsService>(
      () => LocalStorageUsecase(
        getIt.get<LsServiceData>(),
      ),
    );
     getIt.registerFactory<WidServiceData>(
      () => WidgetsFlutterBindingDatasource(),
    );
    getIt.registerFactory<WidService>(
      () => WidgetsFlutterBindingUsecase(
        getIt.get<WidServiceData>(),
      ),
    );
    getIt.registerFactory<FbServiceData>(
      () => FirebaseInitDatasource(),
    );
    getIt.registerFactory<FbService>(
      () => FirebaseInitUsecase(
        getIt.get<FbServiceData>(),
      ),
    );

    getIt.registerSingleton<FeaturesServicePresenter>(
      FeaturesServicePresenter(
                esService: getIt.get<EsService>(),
                fbService: getIt.get<FbService>(),
                lsService: getIt.get<LsService>(),
                widService: getIt.get<WidService>(),
                signInService: getIt.get<SignInService>(),
              )
    );
  }
}