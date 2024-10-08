import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../features/external_storage/domain/interface/external_storage.dart';
import '../features/firebase_init/domain/model/dart_plugin_registrant_model.dart';
import '../features/local_storage/domain/interface/local_storage.dart';

typedef SignInService = UsecaseBase<GoogleSignIn>;

typedef EsService = UsecaseBaseCallData<ExternalStorage, ExternalStorage>;
typedef EsServiceData = Datasource<ExternalStorage>;

typedef FbService = UsecaseBaseCallData<Unit, FirebaseInitModel>;
typedef FbServiceData = Datasource<FirebaseInitModel>;

typedef LsService = UsecaseBaseCallData<LocalStorage, LocalStorage>;
typedef LsServiceData = Datasource<LocalStorage>;

typedef WidService = UsecaseBaseCallData<Unit, WidgetsBinding>;
typedef WidServiceData = Datasource<WidgetsBinding>;
