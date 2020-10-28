abstract class IAddressRepository{
  Future registry(String cep, String descricao, int numero, String latitude, String longitude, int idBairro, int idCidade, int idEstado);
}