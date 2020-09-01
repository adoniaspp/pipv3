import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pipv3/app/models/user_auth_model.dart';
import 'package:pipv3/app/modules/auth_module/repositories/auth_login_interface_repository.dart';
import 'package:pipv3/app/services/shared_preference_interface_service.dart';
import 'package:pipv3/app/util/failure_util.dart';
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

  @observable
  bool usernameCheck = false;

  IAuthLoginRepository authLogin;

  ISharedPreferenceService sharedPreferenceService;

  AuthLoginBase.start(this.sharedPreferenceService);

  AuthLoginBase(this.authLogin, this.sharedPreferenceService);

  @action
  Future<void> signin(String user, String password, BuildContext context) async {
    isloading = true;
    final result = await authLogin.signin(user, password);
    result.fold((e) {
      isloading = false;
      failureUtil = e;
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Usuário ou senha inválidos!')));
    }, (data) {
      isloading = false;
      _startTimeOut();
      sharedPreferenceService.saveRefreshToken(data["refreshtoken"]);
      userAuthModel = UserAuthModel.fromJsonSigin(data);
      Navigator.pushNamed(context, "/");
    });
  }

  @action
  Future<void> refreshToken() async {
    String refreshToken;
    //obter refresh token
    await sharedPreferenceService
        .getRefreshToken()
        .then((value) => {refreshToken = value});
    if (refreshToken != "") {
      String idphone;
      if(Platform.isAndroid)
      {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        idphone = androidInfo.androidId;
      }else
      {
        idphone = "";
      }

      final result = await authLogin.refreshToken(refreshToken, idphone);
      result.fold((e) {
        failureUtil = e;
      }, (data) {
        _startTimeOut();
        sharedPreferenceService.saveRefreshToken(data["refreshtoken"]);
        userAuthModel = UserAuthModel.fromJsonSigin(data);
      });
    }
  }

  @action
  Future<void> signUp(String username, String password) async {
      String idphone;
      if(Platform.isAndroid)
      {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        idphone = androidInfo.androidId;
      }else
      {
        idphone = "";
      }
      
      final result = await authLogin.signUp(username, password, idphone);
      result.fold((e) {
        failureUtil = e;
      }, (data) {
        _startTimeOut();
        sharedPreferenceService.saveRefreshToken(data["refreshtoken"]);
        userAuthModel = UserAuthModel.fromJsonSigin(data);
      });
  }

  @action
  Future<void> verifyUsername(String username) async {
    final result = await authLogin.verifyUsername(username);
      result.fold((e) {
        failureUtil = e;
      }, (data) {
        if(!data){
          usernameCheck = false;
        }else if(data["user"] == username){
          usernameCheck = true;
        }
      });
  } 

  _startTimeOut() {
    Timer(const Duration(seconds: 30), () {
      refreshToken();
    });
  }
}

