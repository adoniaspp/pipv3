import 'package:pipv3/app/modules/auth_module/repositories/auth_login_interface_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';
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

    try{
      final response = await hasuraConnect
        .mutation(hasuraOperation, variables: variables);
        return Right(response["data"]["signIn"]);
    }on HasuraError catch(e){
      //return Left(FailureServerUtil(message: e.message,statusCode: e.extensions.code));
    }
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

    try{
      final response = await hasuraConnect
        .mutation(hasuraOperation, variables: variables);
        return Right(response["data"]["updateRefreshToken"]);
    }on HasuraError catch(e){
      //return Left(FailureServerUtil(message: e.message,statusCode: e.extensions.code));
    }
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

    try{
      final response = await hasuraConnect
        .mutation(hasuraOperation, variables: variables);
        return Right(response["data"]["signUp"]);
    }on HasuraError catch(e){
      //return Left(FailureServerUtil(message: e.message,statusCode: e.extensions.code));
    }
            
  }

  @override
  Future<Either<FailureUtil, dynamic>> verifyUsername(String username) async {
    const hasuraOperation = '''
      query MyQuery(\$username: String!) {
          user(where: {user: {_eq: \$username}}) {
          user
        }
      }    
    ''';
    final variables = {
      "username": username
    };

    try{
      final response = await hasuraConnect
        .query(hasuraOperation, variables: variables);
        if(response["data"]["user"].toString() == "[]"){
           return Right(false);          
        }else{
          return Right(response["data"]["user"][0]);  //Corrigir quando não retorna dados.
        }
    }on HasuraError catch(e){
      //return Left(FailureServerUtil(message: e.message,statusCode: e.extensions.code));
    }
          
  }
}
