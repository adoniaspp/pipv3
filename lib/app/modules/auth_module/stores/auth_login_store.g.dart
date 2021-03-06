// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthLoginStore on AuthLoginBase, Store {
  final _$userAuthModelAtom = Atom(name: 'AuthLoginBase.userAuthModel');

  @override
  UserAuthModel get userAuthModel {
    _$userAuthModelAtom.reportRead();
    return super.userAuthModel;
  }

  @override
  set userAuthModel(UserAuthModel value) {
    _$userAuthModelAtom.reportWrite(value, super.userAuthModel, () {
      super.userAuthModel = value;
    });
  }

  final _$failureUtilAtom = Atom(name: 'AuthLoginBase.failureUtil');

  @override
  FailureUtil get failureUtil {
    _$failureUtilAtom.reportRead();
    return super.failureUtil;
  }

  @override
  set failureUtil(FailureUtil value) {
    _$failureUtilAtom.reportWrite(value, super.failureUtil, () {
      super.failureUtil = value;
    });
  }

  final _$isloadingAtom = Atom(name: 'AuthLoginBase.isloading');

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  final _$usernameCheckAtom = Atom(name: 'AuthLoginBase.usernameCheck');

  @override
  bool get usernameCheck {
    _$usernameCheckAtom.reportRead();
    return super.usernameCheck;
  }

  @override
  set usernameCheck(bool value) {
    _$usernameCheckAtom.reportWrite(value, super.usernameCheck, () {
      super.usernameCheck = value;
    });
  }

  final _$signinAsyncAction = AsyncAction('AuthLoginBase.signin');

  @override
  Future<void> signin(String user, String password, BuildContext context) {
    return _$signinAsyncAction.run(() => super.signin(user, password, context));
  }

  final _$refreshTokenAsyncAction = AsyncAction('AuthLoginBase.refreshToken');

  @override
  Future<void> refreshToken() {
    return _$refreshTokenAsyncAction.run(() => super.refreshToken());
  }

  final _$signUpAsyncAction = AsyncAction('AuthLoginBase.signUp');

  @override
  Future<void> signUp(String username, String password) {
    return _$signUpAsyncAction.run(() => super.signUp(username, password));
  }

  final _$verifyUsernameAsyncAction =
      AsyncAction('AuthLoginBase.verifyUsername');

  @override
  Future<void> verifyUsername(String username) {
    return _$verifyUsernameAsyncAction
        .run(() => super.verifyUsername(username));
  }

  @override
  String toString() {
    return '''
userAuthModel: ${userAuthModel},
failureUtil: ${failureUtil},
isloading: ${isloading},
usernameCheck: ${usernameCheck}
    ''';
  }
}
