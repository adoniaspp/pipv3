import 'package:pipv3/app/modules/auth_module/repositories/auth_login_interface_repository.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:pipv3/app/util/failure_server_util.dart';
import 'package:pipv3/app/util/failure_util.dart';

class AuthLoginRepository extends IAuthLoginRepository {
  @override
  Future<Either<FailureUtil, dynamic>> signin(String user, String password) async {
    Response response;
    Dio dio = new Dio();
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
    final bodyHasura =
        json.encode({"query": hasuraOperation, "variables": variables});
    try {
      response = await dio.post("http://192.168.100.4:8080/v1/graphql",
          options: Options(
            headers: {
              "content-type": "application/json",
            },
          ),
          data: bodyHasura);
          return Right(response.data["data"]["signIn"]);
    } on DioError catch (e) {
      if(e.type == DioErrorType.RESPONSE){
        return Left(FailureServerUtil(message: response.data, statusCode: response.statusCode));
      }else{
        return Left(FailureUtil(e.message));
      }
    }
  }

  @override
  Future<Either<FailureUtil, dynamic>> refreshToken(String refreshToken, String idphone) async{
    idphone = "76";
    Response response;
    Dio dio = new Dio();
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
    final bodyHasura =
        json.encode({"query": hasuraOperation, "variables": variables});
    try {
      response = await dio.post("http://192.168.100.4:8080/v1/graphql",
          options: Options(
            headers: {
              "content-type": "application/json",
            },
          ),
          data: bodyHasura);
          return Right(response.data["data"]["updateRefreshToken"]);
    } on DioError catch (e) {
      if(e.type == DioErrorType.RESPONSE){
        return Left(FailureServerUtil(message: response.data, statusCode: response.statusCode));
      }else{
        return Left(FailureUtil(e.message));
      }
    }

  }
}
