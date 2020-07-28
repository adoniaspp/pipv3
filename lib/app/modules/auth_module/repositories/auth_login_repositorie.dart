import 'package:pipv3/app/modules/auth_module/repositories/auth_login_interface.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class AuthLoginRepository extends IAuthLoginRepository {

  @override
  Future signin(String user, String password) async{
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
        response = await dio.post("http://localhost:8080/v1/graphql",
        options: Options(headers: {
          "content-type": "application/json",
        },),
        data: bodyHasura);
        print(response);
    return response;
  }
}
