import 'package:dependencies/dependencies.dart';
part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {

  @readonly
  UserModel? _userLogged;

  @action
  Future<void> loadUserLogged() async {
    _userLogged = UserModel.empit();
  }

}