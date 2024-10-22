import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import '../utils/typedefs.dart';
import 'current_user_google/domain/model/current_user_model.dart';
import 'external_storage/domain/interface/external_storage.dart';
import 'local_storage/domain/interface/local_storage.dart';
import 'sign_out/domain/model/sign_out_model.dart';

final class FeaturesServicePresenter {
  static FeaturesServicePresenter? _instance;

  late LocalStorage localStorage;
  late ExternalStorage externalStorage;
  late GoogleSignIn signIn;
  late FirebaseAuth auth;
  late User? user;
  late Stream<GoogleSignInAccount?> account;

  final LsService _lsService;
  final EsService _esService;
  final SignInService _signInService;
  final FBAuthService _authService;
  final CAGService _currentAccountService;
  final CUGService _currenUserService;
  final SIOUsecase _siginOutService;

  FeaturesServicePresenter._({
    required EsService esService,
    required LsService lsService,
    required SignInService signInService,
    required FBAuthService authService,
    required CAGService currentAccountService,
    required CUGService currenUserService,
    required SIOUsecase siginOutService,
  })  : _signInService = signInService,
        _esService = esService,
        _authService = authService,
        _currentAccountService = currentAccountService,
        _currenUserService = currenUserService,
        _siginOutService = siginOutService,
        _lsService = lsService;

  factory FeaturesServicePresenter({
    required EsService esService,
    required LsService lsService,
    required SignInService signInService,
    required FBAuthService authService,
    required CAGService currentAccountService,
    required CUGService currenUserService,
    required SIOUsecase siginOutService,
  }) {
    _instance ??= FeaturesServicePresenter._(
      esService: esService,
      lsService: lsService,
      signInService: signInService,
      authService: authService,
      currentAccountService: currentAccountService,
      currenUserService: currenUserService,
      siginOutService: siginOutService,
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

  Future<Unit> siginOutService() async {
    final data = await _siginOutService(NoParams());
    switch (data) {
      case SuccessReturn<SignOutModel>():
        user = null;
        return unit;
      case ErrorReturn<SignOutModel>():
        throw data.result.message;
    }
  }

  Future<Stream<GoogleSignInAccount?>> currentAccountService() async {
    final data = await _currentAccountService(NoParams());
    switch (data) {
      case SuccessReturn<StCAGoogleData>():

      account = data.result;
      
        return data.result;
      case ErrorReturn<StCAGoogleData>():
        throw Exception("Erro ao checar a conta google.");
    }
  }

  Future<User?> currentUserService() async {
    final data = await _currenUserService(NoParams());
    switch (data) {
      case SuccessReturn<CurrentUserModel>():
        user = data.result.user;
        return user;
      case ErrorReturn<CurrentUserModel>():
        return null;
    }
  }

  static FeaturesServicePresenter get to =>
      GetIt.I.get<FeaturesServicePresenter>();
}
