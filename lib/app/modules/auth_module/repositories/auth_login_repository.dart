import 'package:pipv3/app/modules/auth_module/repositories/auth_login_interface_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:pipv3/app/util/failure_server_util.dart';
import 'package:pipv3/app/util/failure_util.dart';

class AuthLoginRepository extends IAuthLoginRepository {
  String url = 'http://192.168.100.4:8080/v1/graphql';
  HasuraConnect hasuraConnect;

  AuthLoginRepository() {
    hasuraConnect = HasuraConnect(url);
  }

  @override
  Future<Either<FailureServerUtil, dynamic>> signin(
      String user, String password) async {
    const hasuraOperation = '''
      mutation Signin(\$password: String!, \$user: String!) {
        signIn(password: \$password, user: \$user) {
          id
          refreshtoken
          token
        }
      }         
        ''';
    final variables = {
      "user": user.toString(),
      "password": password.toString()
    };

    return await hasuraConnect
        .mutation(hasuraOperation, variables: variables)
        .then((value) => value["data"]["signIn"] != null
            ? Right(value["data"]["signIn"])
            : Left(FailureServerUtil(
                message: value["message"], statusCode: value["code"])))
        .catchError((e) => Left(
            FailureServerUtil(message: e["message"], statusCode: e["code"])));
  }

  @override
  Future<Either<FailureUtil, dynamic>> refreshToken(
      String refreshToken, String idphone) async {
    const hasuraOperation = '''
      mutation RefreshToken(\$id_phone: String!, \$refresh_token: String!) {
        updateRefreshToken(id_phone: \$id_phone, refresh_token: \$refresh_token) {
          id
          refreshtoken
          token
        }
      }       
        ''';
    final variables = {
      "id_phone": idphone.toString(),
      "refresh_token": refreshToken.toString()
    };

    return await hasuraConnect
        .mutation(hasuraOperation, variables: variables)
        .then((value) => value["data"]["updateRefreshToken"] != null
            ? Right(value["data"]["updateRefreshToken"])
            : Left(FailureServerUtil(
                message: value["message"], statusCode: value["code"])))
        .catchError((e) => Left(
            FailureServerUtil(message: e["message"], statusCode: e["code"])));
  }

  @override
  Future<Either<FailureUtil, dynamic>> signUp(
      String userName, String password, String idphone) async {
    const hasuraOperation = '''
      mutation Signup(\$id_phone: String!, \$password: String!, \$user: String!) {
        signUp(id_phone: \$id_phone, password: \$password, user: \$user) {
          id
          refreshtoken
          token
        }
    }       
    ''';
    final variables = {
      "user": userName.toString(),
      "id_phone": idphone.toString(),
      "password": password.toString()
    };

    return await hasuraConnect
        .mutation(hasuraOperation, variables: variables)
        .then((value) => value["data"]["signUp"] != null
            ? Right(value["data"]["signUp"])
            : Left(FailureServerUtil(
                message: value["message"], statusCode: value["code"])))
        .catchError((e) => Left(
            FailureServerUtil(message: e["message"], statusCode: e["code"])));
  }

  @override
  Future verifyUsername(String username) {
    throw UnimplementedError();
  }
}
