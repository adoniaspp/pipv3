import 'package:flutter/material.dart';

import 'cad_anuncio_tipo_anuncio_page.dart';

class CadAnuncioMain extends StatefulWidget {
  @override
  _CadAnuncioMainState createState() => _CadAnuncioMainState();
}

class _CadAnuncioMainState extends State<CadAnuncioMain> {
  int index = 0;

  void _next() {
    setState(() {
      index++;
    });
  }

  void _back() {
    setState(() {
      index--;
    });
  }

  void _stepTapped(index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: AppBar(
          leading: Icon(Icons.text_snippet, color: Colors.black54,),
          title: Text(
            "Tipo de Anúncio",
            style: TextStyle(color: Colors.black54),
          ),
          backgroundColor: Colors.grey[300],
        ),
        title: Text("Cadastro de Anúncio"),
      ),
      body: CadAnuncioTipoAnuncio(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: Icon(Icons.arrow_back),
                label: Text("Anterior"),
                onPressed: () {},
              ),
              Text("Etapa 1 de 4"),
              TextButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text("Próximo"),
                onPressed: () {},
              ),
            ],
          ),
          height: 60,
        ),
        elevation: 50,
      ),
    );
  }
}
