import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:pipv3/app/models/user_auth_model.dart';
import 'package:pipv3/app/modules/auth_module/repositories/auth_login_interface.dart';
import 'package:pipv3/app/util/failure_util.dart';

part 'auth_login_store.g.dart';

class AuthLoginStore = AuthLoginBase with _$AuthLoginStore;

abstract class AuthLoginBase with Store {

  @observable
  UserAuthModel userAuthModel;

  @observable
  FailureUtil failureUtil;

  final IAuthLoginRepository authLogin;

  AuthLoginBase(this.authLogin);

  Future<void> signin(String user, String password) async{
    final result = await authLogin.signin(user, password);
    result.fold((e){
      failureUtil = e;  
    }, (data) {
      userAuthModel = UserAuthModel.fromJsonSigin(data);
    });
  }
}