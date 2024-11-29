import 'package:flutter/material.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import '../features/firebase_init/domain/model/dart_plugin_registrant_model.dart';

typedef FbService = UsecaseBaseCallData<Unit, FirebaseInitModel>;
typedef FbServiceData = Datasource<FirebaseInitModel>;

typedef WidService = UsecaseBaseCallData<Unit, WidgetsBinding>;
typedef WidServiceData = Datasource<WidgetsBinding>;