import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../features/current_user_google/domain/model/current_user_model.dart';
import '../features/external_storage/domain/interface/external_storage.dart';
import '../features/local_storage/domain/interface/local_storage.dart';

typedef SignInService = UsecaseBase<GoogleSignIn>;

typedef FBAuthService = UsecaseBase<FirebaseAuth>;

typedef EsService = UsecaseBaseCallData<ExternalStorage, ExternalStorage>;
typedef EsServiceData = Datasource<ExternalStorage>;

typedef LsService = UsecaseBaseCallData<LocalStorage, LocalStorage>;
typedef LsServiceData = Datasource<LocalStorage>;

typedef CAGService = UsecaseBase<StCAGoogleData>;
typedef StCAGoogleData = Stream<GoogleSignInAccount?>;

typedef CUGService =  UsecaseBase<CurrentUserModel>;
