import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../sevices/features/features_service_presenter.dart';
import '../utils/todo_list_navigator.dart';

final class AuthListen extends ChangeNotifier {
  final FeaturesServicePresenter _featuresServicePresenter;

  AuthListen(FeaturesServicePresenter featuresServicePresenter) : _featuresServicePresenter = featuresServicePresenter;

  Future<void> logout() async {
    await _featuresServicePresenter.siginOutService();
    notifyListeners();
  }

  User? get user => _featuresServicePresenter.user;


  void loadListen() async{
    print("Listen auth....");
    _featuresServicePresenter.auth.userChanges().listen((_) => notifyListeners());
    _featuresServicePresenter.account.listen((account){
        if (account != null) {
          print("Listen auth account != null");
        TodoListNavigator.to.pushNamedAndRemoveUntil("/home", (route) => false);
      } else {
        print("Listen auth account = null");
          TodoListNavigator.to.pushNamedAndRemoveUntil("/login", (route) => false);
      }
      print("Listen auth account direct");
          TodoListNavigator.to.pushNamedAndRemoveUntil("/login", (route) => false);
    });
    // _featuresServicePresenter.auth.idTokenChanges().listen((account){
    //   if (account != null) {
    //     TodoListNavigator.to.pushNamedAndRemoveUntil("/home", (route) => false);
    //   } else {
    //       TodoListNavigator.to.pushNamedAndRemoveUntil("/login", (route) => false);
    //   }
    // });
  }
}
