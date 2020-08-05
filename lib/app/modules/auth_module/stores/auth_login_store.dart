import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:pipv3/app/models/user_auth_model.dart';
import 'package:pipv3/app/modules/auth_module/repositories/auth_login_interface_repository.dart';
import 'package:pipv3/app/services/shared_preference_interface_service.dart';
import 'package:pipv3/app/util/failure_util.dart';
import 'package:pipv3/app/util/timer_util.dart';
import 'package:device_info/device_info.dart';

part 'auth_login_store.g.dart';

class AuthLoginStore = AuthLoginBase with _$AuthLoginStore;

abstract class AuthLoginBase with Store {

  @observable
  UserAuthModel userAuthModel = UserAuthModel();

  @observable
  FailureUtil failureUtil;

  @observable
  bool isloading = false;

  final IAuthLoginRepository authLogin;

  final ISharedPreferenceService sharedPreferenceService;

  AuthLoginBase(this.authLogin, this.sharedPreferenceService);

  @action
  Future<void> signin(String user, String password) async{
    isloading = true;
    final result = await authLogin.signin(user, password);
    result.fold((e){
      failureUtil = e;  
    }, (data) {
      TimerUtil().startTimeOut();
      sharedPreferenceService.saveRefreshToken(data["refreshtoken"]);
      userAuthModel = UserAuthModel.fromJsonSigin(data); 
    });
    isloading = false;
  }

  @action
  Future<void> refreshToken() async
  { 
    String refreshToken;
    //obter refresh token
    sharedPreferenceService.getRefreshToken().then((value) => {
      refreshToken = value
    });
    //obter idphone
    String idphone;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    idphone = androidInfo.androidId;

    final result = await authLogin.refreshToken(refreshToken, idphone);
    result.fold((e){
      failureUtil = e;  
    }, (data) {
      TimerUtil().startTimeOut();
      sharedPreferenceService.saveRefreshToken(data["refreshtoken"]);
      userAuthModel = UserAuthModel.fromJsonSigin(data); 
    });
    isloading = false;
  }
}