import 'package:mobx/mobx.dart';
import 'package:pipv3/app/modules/auth_module/repositories/auth_login_interface.dart';

part 'auth_login_store.g.dart';

class AuthLoginStore = AuthLoginBase with _$AuthLoginStore;

abstract class AuthLoginBase with Store {

  final IAuthLoginRepository authLogin;

  AuthLoginBase(this.authLogin);

  void signin(String user, String password) {
    authLogin.signin(user, password);
  }
}