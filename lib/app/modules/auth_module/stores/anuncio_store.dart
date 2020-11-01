import 'package:mobx/mobx.dart';
import 'package:pipv3/app/modules/auth_module/repositories/address_interface_repository.dart';

part 'anuncio_store.g.dart';

class AnuncioStore = AnuncioStoreBase with _$AnuncioStore;

abstract class AnuncioStoreBase with Store {

  IAddressRepository addressRepository;

  AnuncioStoreBase(this.addressRepository);

  @action
  Future<void> cadastrarAnuncio(){

  } 

}
