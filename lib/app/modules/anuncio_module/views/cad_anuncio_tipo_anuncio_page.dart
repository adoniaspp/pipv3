import 'package:flutter/material.dart';
import 'package:pipv3/app/modules/anuncio_module/models/AnuncioModel.dart';
import 'package:provider/provider.dart';

class CadAnuncioTipoAnuncio extends StatefulWidget {
  @override
  _CadAnuncioTipoAnuncioState createState() => _CadAnuncioTipoAnuncioState();
}

class _CadAnuncioTipoAnuncioState extends State<CadAnuncioTipoAnuncio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 2,
            child: GestureDetector(onTap: () {
              context.read<AnuncioModel>().selectButton1();    
            }, child:
              AnimatedContainer(
                duration: Duration(seconds: 1),
                alignment: Alignment.center,
                child: Text("Venda"),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: context.watch<AnuncioModel>().colorButton1,
                        width: context.watch<AnuncioModel>().borderButton1
                        )),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: GestureDetector(onTap: () {
              context.read<AnuncioModel>().selectButton2();             
            }, child:AnimatedContainer(
                duration: Duration(seconds: 1),
                alignment: Alignment.center,
                child: Text("Aluguel"),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: context.watch<AnuncioModel>().colorButton2,
                        width: context.watch<AnuncioModel>().borderButton2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
