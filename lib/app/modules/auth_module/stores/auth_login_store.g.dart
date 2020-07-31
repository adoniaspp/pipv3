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

  final _$signinAsyncAction = AsyncAction('AuthLoginBase.signin');

  @override
  Future<void> signin(String user, String password) {
    return _$signinAsyncAction.run(() => super.signin(user, password));
  }

  @override
  String toString() {
    return '''
userAuthModel: ${userAuthModel},
failureUtil: ${failureUtil},
isloading: ${isloading}
    ''';
  }
}
