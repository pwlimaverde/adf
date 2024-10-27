import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../core/utils/module.dart';
import '../core/utils/routes.dart';
import '../sevices/features/features_service_presenter.dart';
import 'features/features_home_presenter.dart';
import 'features/update_display_name/domain/usecase/update_display_name_usecase.dart';
import 'ui/home_controller.dart';
import 'ui/home_page.dart';
import 'utils/typedefs.dart';

final class HomeModule extends Module {
  HomeModule()
      : super(
          bindings: [
            Provider<FirebaseAuth>(
              create: (_) => FeaturesServicePresenter.to.auth,
              lazy: true,
            ),
            Provider<UDNsecase>(
              create: (context) => UpdateDisplayNameUsecase(
                context.read<FirebaseAuth>(),
              ),
              lazy: true,
            ),
            Provider<FeaturesHomePresenter>(
              create: (context) => FeaturesHomePresenter(
                updateDisplayName: context.read<UDNsecase>(),
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
