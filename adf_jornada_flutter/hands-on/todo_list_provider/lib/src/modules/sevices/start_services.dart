
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import 'features/features_service_presenter.dart';



Future<void> startServices({
  required FirebaseOptions options,
  required BuildContext context
}) async {
  final instance =  Provider.of<FeaturesServicePresenter>(context, listen: false);
  List<Future<dynamic>> sevisesInit = [
    instance.widgetsFlutterBindingService(),
    instance.firebaseInitService(options: options),
    instance.localStorageService(),
    instance.googleSignInService(),
  ];


  await Service.to.initServices(sevisesInit);
}
