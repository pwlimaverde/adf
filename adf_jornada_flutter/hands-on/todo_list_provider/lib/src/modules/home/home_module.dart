import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../core/utils/module.dart';
import '../core/utils/routes.dart';
import '../sevices/features/features_service_presenter.dart';
import 'features/features_home_presenter.dart';
import 'features/update_display_name/domain/usecase/update_display_name_usecase.dart';
import 'features/update_foto/datasources/update_foto_datasource.dart';
import 'features/update_foto/domain/usecase/update_foto_usecase.dart';
import 'ui/home_controller.dart';
import 'ui/home_page.dart';
import 'utils/typedefs.dart';

final class HomeModule extends Module {
  HomeModule()
      : super(
          bindings: [
            Provider<ImagePicker>(
              create: (_) => ImagePicker(),
              lazy: true,
            ),
            Provider<FirebaseStorage>(
              create: (_) => FeaturesServicePresenter.to.firebaseStorage,
              lazy: true,
            ),
            Provider<FirebaseAuth>(
              create: (_) => FeaturesServicePresenter.to.auth,
              lazy: true,
            ),
            Provider<UDNusecase>(
              create: (context) => UpdateDisplayNameUsecase(
                context.read<FirebaseAuth>(),
              ),
              lazy: true,
            ),
            Provider<UFdata>(
              create: (context) => UpdateFotoDatasource(
                firebaseStorage: context.read<FirebaseStorage>(),
                picker: context.read<ImagePicker>(),
                authInstance: context.read<FirebaseAuth>(),
              ),
              lazy: true,
            ),
            Provider<UFusecase>(
              create: (context) => UpdateFotoUsecase(
                context.read<UFdata>(),
              ),
              lazy: true,
            ),
            Provider<FeaturesHomePresenter>(
              create: (context) => FeaturesHomePresenter(
                updateDisplayName: context.read<UDNusecase>(),
                updateFoto: context.read<UFusecase>(),
              ),
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => HomeController(
                featuresHomePresenter: context.read<FeaturesHomePresenter>(),
                featuresServicePresenter: context.read<FeaturesServicePresenter>(),
              ),lazy: false,
            )
          ],
          routes: {
            Routes.home.caminho: (context) => const HomePage(),
          },
        );
}
