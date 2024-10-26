import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import '../utils/typedefs.dart';
import 'current_user_google/domain/model/current_user_model.dart';
import 'external_storage/domain/interface/external_storage.dart';
import 'local_storage/domain/interface/local_storage.dart';

final class FeaturesServicePresenter {
  static FeaturesServicePresenter? _instance;

  late LocalStorage localStorage;
  late ExternalStorage externalStorage;
  late GoogleSignIn signIn;
  late FirebaseAuth auth;
  late User? user;

  final LsService _lsService;
  final EsService _esService;
  final SignInService _signInService;
  final FBAuthService _authService;
  final CUGService _currenUserService;

  FeaturesServicePresenter._({
    required EsService esService,
    required LsService lsService,
    required SignInService signInService,
    required FBAuthService authService,
    required CUGService currenUserService,
  })  : _signInService = signInService,
        _esService = esService,
        _authService = authService,
        _currenUserService = currenUserService,
        _lsService = lsService;

  factory FeaturesServicePresenter({
    required EsService esService,
    required LsService lsService,
    required SignInService signInService,
    required FBAuthService authService,
    required CUGService currenUserService,
  }) {
    _instance ??= FeaturesServicePresenter._(
      esService: esService,
      lsService: lsService,
      signInService: signInService,
      authService: authService,
      currenUserService: currenUserService,
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

  Future<Unit> localStorageService() async {
    final data = await _lsService(NoParams());
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
        return unit;
      case ErrorReturn<CurrentUserModel>():
        return null;
    }
  }

  static FeaturesServicePresenter get to =>
      GetIt.I.get<FeaturesServicePresenter>();
}
