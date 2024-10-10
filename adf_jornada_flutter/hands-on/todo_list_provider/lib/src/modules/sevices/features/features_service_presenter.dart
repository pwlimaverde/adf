import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'external_storage/domain/interface/external_storage.dart';
import 'local_storage/domain/interface/local_storage.dart';

final class FeaturesServicePresenter {
  static FeaturesServicePresenter? _instance;

  late LocalStorage localStorage;
  late ExternalStorage externalStorage;
  late GoogleSignIn signIn;

  final FbService _fbService;
  final LsService _lsService;
  final EsService _esService;
  final WidService _widService;
  final SignInService _signInService;


  FeaturesServicePresenter._({
    required FbService fbService,
    required EsService esService,
    required LsService lsService,
    required WidService widService,
    required SignInService signInService,
  })  : _signInService = signInService,
        _widService = widService,
        _esService = esService,
        _fbService = fbService,
        _lsService = lsService;

  factory FeaturesServicePresenter({
    required EsService esService,
    required FbService fbService,
    required LsService lsService,
    required WidService widService,
    required SignInService signInService,
  }) {
    _instance ??= FeaturesServicePresenter._(
      esService: esService,
      fbService: fbService,
      lsService: lsService,
      widService: widService,
      signInService: signInService,
    );
    return _instance!;
  }

  Future<Unit> firebaseInitService({required FirebaseOptions options}) async {
    final data = await _fbService(ParametrosFirebaseInit(
        options: options,
        error: ErrorGeneric(
          message: "Erro ao inializar firebase",
        )));
    switch (data) {
      case SuccessReturn<Unit>():
        await _externalStorageService(FirebaseFirestore.instance);
        return unit;
      case ErrorReturn<Unit>():
        throw data.result.message;
    }
  }

  Future<void> _externalStorageService(FirebaseFirestore instance) async {
    final data = await _esService(
      ParametrosFirebaseStorage(
        instanceFirebase: instance,
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

  Future<Unit> widgetsFlutterBindingService() async {
    final data = await _widService(NoParams());
    switch (data) {
      case SuccessReturn<Unit>():
        return unit;
      case ErrorReturn<Unit>():
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

  static FeaturesServicePresenter get to =>
      GetIt.I.get<FeaturesServicePresenter>();
}
