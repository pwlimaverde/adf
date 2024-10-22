import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../sevices/features/features_service_presenter.dart';
import '../utils/todo_list_navigator.dart';

final class AuthListen extends ChangeNotifier {
  final FeaturesServicePresenter _featuresServicePresenter;

  AuthListen(FeaturesServicePresenter featuresServicePresenter)
      : _featuresServicePresenter = featuresServicePresenter;

  Future<void> logout() async {
    await _featuresServicePresenter.siginOutService();
    notifyListeners();
  }

  User? get user => _featuresServicePresenter.user;

  void loadListen() async {
    print("Listen auth....");
    _featuresServicePresenter.auth
        .userChanges()
        .listen((_) => notifyListeners());
   
    _featuresServicePresenter.account.listen((account)async{
        if (account != null) {
          await Future.delayed(const Duration(milliseconds: 500));
          final user = await _featuresServicePresenter.currentUserService();
          print("Listen google account ${user?.displayName}");
          print("Listen google account != null");
        TodoListNavigator.to.pushNamedAndRemoveUntil("/home", (route) => false);
      } else {
        print("Listen google account = null");
        await Future.delayed(const Duration(milliseconds: 500));
          TodoListNavigator.to.pushNamedAndRemoveUntil("/login", (route) => false);
      }
    });
    _featuresServicePresenter.auth.idTokenChanges().listen((user) async{
      if (user != null) {

        await Future.delayed(const Duration(milliseconds: 500));
        TodoListNavigator.to.pushNamedAndRemoveUntil("/home", (route) => false);
      } else {

        await Future.delayed(const Duration(microseconds: 500));
        TodoListNavigator.to
            .pushNamedAndRemoveUntil("/login", (route) => false);
      }
    });
  }
}
