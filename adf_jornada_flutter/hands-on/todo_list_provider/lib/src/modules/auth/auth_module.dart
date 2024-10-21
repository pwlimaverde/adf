import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';


import '../core/utils/module.dart';
import '../core/utils/routes.dart';
import '../sevices/features/features_service_presenter.dart';
import 'features/features_auth_presenter.dart';

import 'features/forgot_password/domain/usecase/forgot_password_usecase.dart';
import 'features/login_with_email/domain/usecase/login_with_email_usecase.dart';
import 'features/register_firebase_auth/domain/usecase/register_firebase_auth_usecase.dart';
import 'features/sign_in_with_google/datasources/sign_in_with_google_datasource/sign_in_with_google_android_datasource.dart';
import 'features/sign_in_with_google/domain/usecase/sign_in_with_google_usecase.dart';

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
              create: (_) => FeaturesServicePresenter.to.auth,
              lazy: true,
            ),
            ProxyProvider<FeaturesServicePresenter, GoogleSignIn>(
              update: (context, featuresServicePresenter, googleSignIn) =>
                  featuresServicePresenter.signIn,
              lazy: true,
            ),
     
            Provider<RFUsecase>(
              create: (context) => RegisterFirebaseAuthUsecase(context.read<FirebaseAuth>()),
              lazy: true,
            ),
            Provider<LWEUsecase>(
              create: (context) => LoginWithEmailUsecase(context.read<FirebaseAuth>()),
              lazy: true,
            ),
            Provider<FPUsecase>(
              create: (context) => ForgotPasswordUsecase(context.read<FirebaseAuth>()),
              lazy: true,
            ),
            Provider<LWGData>(
              create: (context) => SignInWithGoogleDatasource(
                signIn: context.read<GoogleSignIn>(),
                authInstance: context.read<FirebaseAuth>(),
              ),
              lazy: true,
            ),
            Provider<LWGUsecase>(
              create: (context) => SignInWithGoogleUsecase(
                context.read<LWGData>(),
              ),
              lazy: true,
            ),
            Provider<FeaturesAuthPresenter>(
              create: (context) => FeaturesAuthPresenter(
                loginWithEmail: context.read<LWEUsecase>(),
                registerFirebaseAuth: context.read<RFUsecase>(),
                forgotPassword: context.read<FPUsecase>(),
                loginWithGoogle: context.read<LWGUsecase>(),
              ),
              lazy: false,
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
