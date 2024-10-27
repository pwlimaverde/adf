import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../features/forgot_password/domain/model/forgot_password_model.dart';
import '../features/login_with_email/domain/model/login_with_email_model.dart';
import '../features/register_firebase_auth/domain/model/register_firebase_auth_model.dart';
import '../features/sign_in_with_google/domain/model/login_with_google_model.dart';

typedef AuthUsecase = UsecaseBase<FirebaseAuth>;

typedef RFUsecase =  UsecaseBase<RegisterFirebaseAuthModel>;

typedef LWEUsecase =  UsecaseBase<LoginWithEmailModel>;

typedef FPUsecase =  UsecaseBase<ForgotPasswordModel>;

typedef LWGUsecase =  UsecaseBaseCallData<LoginWithGoogleModel, LoginWithGoogleModel>;
typedef LWGData =  Datasource<LoginWithGoogleModel>;

typedef CAGUsecase = UsecaseBase<StCAGoogleData>;
typedef StCAGoogleData = Stream<GoogleSignInAccount?>;