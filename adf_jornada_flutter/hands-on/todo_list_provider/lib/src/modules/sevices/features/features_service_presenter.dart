import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'current_user_google/domain/model/current_user_model.dart';
import 'external_storage/domain/interface/external_storage.dart';
import 'local_storage/datasource/sqlite/config/sqlite_connection.dart';
import 'local_storage/domain/interface/local_storage.dart';
import 'sign_out/domain/model/sign_out_model.dart';

final class FeaturesServicePresenter {
  static FeaturesServicePresenter? _instance;

  LocalStorage? localStorage;
  late ExternalStorage externalStorage;
  late GoogleSignIn signIn;
  late FirebaseAuth auth;
  late FirebaseStorage firebaseStorage;
  late User? user;

  final LsService _lsService;
  final EsService _esService;
  final SignInService _signInService;
  final FBAuthService _authService;
  final CUGService _currenUserService;
  final SIOUsecase _signOutService;
  final FBStorageService _fbStorageService;

  FeaturesServicePresenter._({
    required EsService esService,
    required LsService lsService,
    required SignInService signInService,
    required FBAuthService authService,
    required CUGService currenUserService,
    required SIOUsecase signOutService,
    required FBStorageService fbStorageService,
  })  : _signInService = signInService,
        _esService = esService,
        _authService = authService,
        _currenUserService = currenUserService,
        _signOutService = signOutService,
        _fbStorageService = fbStorageService,
        _lsService = lsService;

  factory FeaturesServicePresenter({
    required EsService esService,
    required LsService lsService,
    required SignInService signInService,
    required FBAuthService authService,
    required CUGService currenUserService,
    required SIOUsecase signOutService,
    required FBStorageService fbStorageService,
  }) {
    _instance ??= FeaturesServicePresenter._(
      esService: esService,
      lsService: lsService,
      signInService: signInService,
      authService: authService,
      currenUserService: currenUserService,
      signOutService: signOutService,
      fbStorageService: fbStorageService,
    );
    return _instance!;
  }

  Future<void> externalStorageService() async {
    final data = await _esService(
      NoParams(
        error: ErrorGeneric(
          message: "Erro  ao carregar instancia do firebase",
        ),
      ),
    );
    switch (data) {
      case SuccessReturn<ExternalStorage>():
        externalStorage = data.result;
      case ErrorReturn<ExternalStorage>():
        throw data.result.message;
    }
  }

  Future<Unit> localStorageService(String uid) async {
    final data = await _lsService(ParametrosUid(
      uid: uid,
      error: ErrorGeneric(message: 'Erro Geral'),
    ));
    switch (data) {
      case SuccessReturn<LocalStorage>():
        localStorage = data.result;
        return unit;
      case ErrorReturn<LocalStorage>():
        throw data.result.message;
    }
  }

  Future<Unit> googleSignInService() async {
    final data = await _signInService(NoParams());
    switch (data) {
      case SuccessReturn<GoogleSignIn>():
        signIn = data.result;
        return unit;
      case ErrorReturn<GoogleSignIn>():
        throw data.result.message;
    }
  }

  Future<Unit> authInitService() async {
    final data = await _authService(NoParams());
    switch (data) {
      case SuccessReturn<FirebaseAuth>():
        auth = data.result;
        return unit;
      case ErrorReturn<FirebaseAuth>():
        throw data.result.message;
    }
  }

  Future<Unit> firebaseStorageInitService() async {
    final data = await _fbStorageService(NoParams());
    switch (data) {
      case SuccessReturn<FirebaseStorage>():
        firebaseStorage = data.result;
        return unit;
      case ErrorReturn<FirebaseStorage>():
        throw data.result.message;
    }
  }

  // Future<Unit> currentAccountService() async {
  //   final data = await _currentAccountService(NoParams());
  //   switch (data) {
  //     case SuccessReturn<StCAGoogleData>():
  //       account = data.result;

  //       return unit;
  //     case ErrorReturn<StCAGoogleData>():
  //       throw Exception("Erro ao checar a conta google.");
  //   }
  // }

  Future<Unit?> currentUserService() async {
    final data = await _currenUserService(NoParams());
    switch (data) {
      case SuccessReturn<CurrentUserModel>():
        user = data.result.user;
        Logger().f('_uid currentUserService: ${data.result.user.uid}');
        await localStorageService(data.result.user.uid);
        return unit;
      case ErrorReturn<CurrentUserModel>():
        return null;
    }
  }

  Future<Unit> signOutService() async {
    final data = await _signOutService(NoParams());
    switch (data) {
      case SuccessReturn<SignOutModel>():
        GetIt.I.get<SqliteConnection>().closeConnection();
        user = null;
        localStorage = null;
        return unit;
      case ErrorReturn<SignOutModel>():
        throw data.result.message;
    }
  }

  static FeaturesServicePresenter get to =>
      GetIt.I.get<FeaturesServicePresenter>();
}
