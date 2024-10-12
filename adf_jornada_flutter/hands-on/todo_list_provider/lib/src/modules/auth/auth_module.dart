import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../core/utils/module.dart';
import '../core/utils/routes.dart';
import 'features/features_auth_presenter.dart';
import 'features/firebase_auth/domain/usecase/firebase_auth_usecase.dart';
import 'features/login_with_email/domain/usecase/loguin_with_email_usecase.dart';
import 'features/register_firebase_auth/domain/usecase/register_firebase_auth_usecase.dart';
import 'ui/login/login_controller.dart';
import 'ui/login/login_page.dart';
import 'ui/register/register_controller.dart';
import 'ui/register/register_page.dart';
import 'utils/typedefs.dart';

final class AuthModule extends Module {
  AuthModule()
      : super(
          bindings: [
            Provider<FirebaseAuth>(
              create: (_) => FirebaseAuth.instance,
              lazy: true,
            ),
            ProxyProvider<FirebaseAuth, AuthUsecase>(
              update: (context, firebaseAuth, authService) =>
                  FirebaseAuthUsecase(firebaseAuth),
              lazy: true,
            ),
            Provider<RFUsecase>(
              create: (_) => RegisterFirebaseAuthUsecase(),
              lazy: true,
            ),
            Provider<LWEUsecase>(
              create: (_) => LoguinWithEmailUsecase(),
              lazy: true,
            ),
            Provider<FeaturesAuthPresenter>(
              create: (context) {
                final presenter = FeaturesAuthPresenter(
                  authUsecase: context.read<AuthUsecase>(),
                  loguinWithEmail: context.read<LWEUsecase>(),
                  registerFirebaseAuth: context.read<RFUsecase>(),
                );
                presenter.authInit();
                return presenter;
              },
              lazy: false,
            ),
            ChangeNotifierProvider(
              create: (context) => LoginController(context.read()),
            ),
            ChangeNotifierProvider(
              create: (context) => RegisterController(context.read()),
            )
          ],
          routes: {
            Routes.login.caminho: (context) => const LoginPage(),
            Routes.register.caminho: (context) => const RegisterPage(),
          },
        );
}
