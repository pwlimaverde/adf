import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../core/utils/module.dart';
import 'features/external_storage/datasource/firebase/firebase_storage_datasource.dart';
import 'features/external_storage/domain/usecase/external_storage_usecase.dart';
import 'features/features_service_presenter.dart';
import 'features/firebase_init/datasource/firebase_init_datasource.dart';
import 'features/firebase_init/domain/usecase/firebase_init_usecase.dart';
import 'features/google_sign_in/domain/usecase/google_sign_in_usecase.dart';
import 'features/local_storage/datasource/hive_storage_datasource.dart';
import 'features/local_storage/domain/usecase/local_storage_usecase.dart';
import 'features/widgets_flutter_binding/datasource/widgets_flutter_binding_datasource.dart';
import 'features/widgets_flutter_binding/domain/usecase/widgets_flutter_binding_usecase.dart';
import 'utils/scopes.dart';
import 'utils/typedefs.dart';

final class ServicesBindings extends Module {
  ServicesBindings()
      : super(
          aplicationsBindings: [
            Provider<FbServiceData>(
              create: (_) => FirebaseInitDatasource(),
              lazy: false,
            ),
            ProxyProvider<FbServiceData, FbService>(
              update: (context, fbServiceData, _) =>
                  FirebaseInitUsecase(fbServiceData),
            ),
            Provider<WidServiceData>(
              create: (_) => WidgetsFlutterBindingDatasource(),
              lazy: false,
            ),
            ProxyProvider<WidServiceData, WidService>(
              update: (context, widServiceData, _) =>
                  WidgetsFlutterBindingUsecase(widServiceData),
            ),
            Provider<LsServiceData>(
              create: (_) => HiveStorageDatasource(),
              lazy: false,
            ),
            ProxyProvider<LsServiceData, LsService>(
              update: (context, lsServiceData, _) =>
                  LocalStorageUsecase(lsServiceData),
            ),
            Provider<EsServiceData>(
              create: (_) => FirebaseStorageDatasource(),
              lazy: false,
            ),
            ProxyProvider<EsServiceData, EsService>(
              update: (context, esServiceData, _) =>
                  ExternalStorageUsecase(esServiceData),
            ),
            Provider<GoogleSignIn>(
              create: (_) => GoogleSignIn(scopes: scopes),
              lazy: false,
            ),
            ProxyProvider<GoogleSignIn, SignInService>(
              update: (context, googleSignIn, _) =>
                  GoogleSignInUsecase(googleSignIn),
            ),
            ProxyProvider5<EsService, FbService, LsService, WidService,
                SignInService, FeaturesServicePresenter>(
              update: (
                context,
                esService,
                fbService,
                lsService,
                widService,
                signInService,
                _,
              ) =>
                  FeaturesServicePresenter(
                esService: esService,
                fbService: fbService,
                lsService: lsService,
                widService: widService,
                signInService: signInService,
              ),
            ),
          ],
          routes: {},
        );
        
}
