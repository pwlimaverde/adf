import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/database/sqlite/sqlite_connection.dart';
import 'features/current_user_google/domain/usecase/current_user_google_usecase.dart';
import 'features/external_storage/datasource/firebase/firebase_storage_datasource.dart';
import 'features/external_storage/domain/usecase/external_storage_usecase.dart';
import 'features/features_service_presenter.dart';

import 'features/firebase_auth/domain/usecase/firebase_auth_usecase.dart';
import 'features/firebase_storage/domain/usecase/firebase_storage_usecase.dart';
import 'features/google_sign_in/domain/usecase/google_sign_in_usecase.dart';
import 'features/local_storage/datasource/sqlite/sqlite_storage_datasource.dart';
import 'features/local_storage/domain/usecase/local_storage_usecase.dart';
import 'features/sign_out/domain/usecase/sign_out_usecase.dart';
import 'utils/scopes.dart';
import 'utils/typedefs.dart';

final class ServiceBindings {
  final getIt = GetIt.I;
  Future<void> initBindings() async {
    getIt.registerSingleton<FirebaseStorage>(
      FirebaseStorage.instance,
    );
    getIt.registerSingleton<FirebaseFirestore>(
      FirebaseFirestore.instance,
    );
    getIt.registerSingleton<FirebaseAuth>(
      FirebaseAuth.instance,
    );
    getIt.registerSingleton<GoogleSignIn>(
      GoogleSignIn(scopes: scopes),
    );
    getIt.registerFactory<FBAuthService>(
      () => FirebaseAuthUsecase(getIt.get<FirebaseAuth>()),
    );
    getIt.registerFactory<FBStorageService>(
      () => FirebaseStorageUsecase(getIt.get<FirebaseStorage>()),
    );
    getIt.registerFactory<CUGService>(
      () => CurrentUserGoogleUsecase(getIt.get<FirebaseAuth>()),
    );
    getIt.registerFactory<SignInService>(
      () => GoogleSignInUsecase(
        getIt.get<GoogleSignIn>(),
      ),
    );
    getIt.registerFactory<EsServiceData>(
      () => FirebaseStorageDatasource(getIt.get<FirebaseFirestore>()),
    );
    getIt.registerFactory<EsService>(
      () => ExternalStorageUsecase(
        getIt.get<EsServiceData>(),
      ),
    );
    getIt.registerFactory<SqliteConnection>(
      () => SqliteConnection(),
    );
    getIt.registerFactory<LsServiceData>(
      () => SqliteStorageDatasource(getIt.get<SqliteConnection>()),
    );
    getIt.registerFactory<LsService>(
      () => LocalStorageUsecase(
        getIt.get<LsServiceData>(),
      ),
    );
    getIt.registerFactory<SIOUsecase>(
      () => SignOutUsecase(
        signIn: getIt.get<GoogleSignIn>(),
        auth: getIt.get<FirebaseAuth>(),
      ),
    );
    getIt.registerSingleton<FeaturesServicePresenter>(FeaturesServicePresenter(
      esService: getIt.get<EsService>(),
      lsService: getIt.get<LsService>(),
      signInService: getIt.get<SignInService>(),
      authService: getIt.get<FBAuthService>(),
      currenUserService: getIt.get<CUGService>(),
      signOutService: getIt.get<SIOUsecase>(),
      fbStorageService: getIt.get<FBStorageService>(),
    ));
  }
}
