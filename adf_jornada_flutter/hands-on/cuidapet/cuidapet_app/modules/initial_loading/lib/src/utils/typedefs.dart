import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../features/firebase_init/domain/model/dart_plugin_registrant_model.dart';

typedef FbService = UsecaseBaseCallData<Unit, FirebaseInitModel>;
typedef FbServiceData = Datasource<FirebaseInitModel>;

typedef WidService = UsecaseBaseCallData<Unit, WidgetsBinding>;
typedef WidServiceData = Datasource<WidgetsBinding>;