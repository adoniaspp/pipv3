import 'package:pipv3/app/modules/anuncio_module/repositories/address_interface_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AddressRepository extends IAddressRepository{

  String url = 'http://192.168.100.4:8080/v1/graphql';
  HasuraConnect hasuraConnect;

  AddressRepository() {
    hasuraConnect = HasuraConnect(url);
  }

  @override
  Future registry(String cep, String descricao, int numero, String latitude, String longitude, int idBairro, int idCidade, int idEstado) async {
    const hasuraOperation = '''
    mutation MyMutation(\$cep: String!, \$descricao: String!, \$latitude: String!, \$longitude: String!, \$numero: Int!, \$id_bairro: Int!, \$id_cidade: Int!, \$id_estado: Int!) {
        insert_endereco(objects: {cep: \$cep, descricao: \$descricao, latitude: \$latitude, longitude: \$longitude, numero: \$numero, id_bairro: \$id_bairro, id_cidade: \$id_cidade, id_estado: \$id_estado}) {
        returning {
          id
        }
      }
    }        
        ''';
    final variables = {
      "cep": cep.toString(),
      "descricao": descricao.toString(),
      "numero": numero,
      "latitude": latitude.toString(),
      "longitude": longitude.toString(),
      "id_bairro": idBairro,
      "id_cidade": idCidade,
      "id_estado": idEstado
    };

    try{
      final response = await hasuraConnect
        .mutation(hasuraOperation, variables: variables);
        return Right(response["data"]["insert_endereco"]["returning"]);
    }on HasuraError catch(e){
      //return Left(FailureServerUtil(message: e.message,statusCode: e.extensions.code));
    }

  }
  
}