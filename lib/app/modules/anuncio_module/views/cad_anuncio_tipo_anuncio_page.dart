import 'package:flutter/material.dart';

class CadAnuncioTipoAnuncio extends StatefulWidget {
  @override
  _CadAnuncioTipoAnuncioState createState() => _CadAnuncioTipoAnuncioState();
}

class _CadAnuncioTipoAnuncioState extends State<CadAnuncioTipoAnuncio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        crossAxisCount: 1,
        children: [
          InkWell(
            onTap: () {
              print("olá 1");
            },
            child: Image.network(
                "https://www.realestate.com.au/blog/images/800x450-fit,progressive/2018/01/12113253/capi_85dab0336e0fbceec553b561e8aa87cd_b19c9de7f91176d7817d28f2979cefed.jpeg",
                scale: 2.0,
                ),
          ),
          InkWell(
            onTap: () {
              print("olá 2");
            },
            child: Image.network(
                "https://www.realestate.com.au/blog/images/800x450-fit,progressive/2018/01/12113253/capi_85dab0336e0fbceec553b561e8aa87cd_b19c9de7f91176d7817d28f2979cefed.jpeg"),
          )
        ],
      ),
    );
  }
}
