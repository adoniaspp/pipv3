import 'package:flutter/material.dart';

class RegistrarAnuncio extends StatefulWidget {
  @override
  _RegistrarAnuncioState createState() => _RegistrarAnuncioState();
}

class _RegistrarAnuncioState extends State<RegistrarAnuncio> {
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
        title: Text("Cadastro de Anúncio"),
      ),
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: Icon(Icons.arrow_back),
                label: Text("Anterior"),
                onPressed: (){},
              ),
              Text("Etapa 1 de 4"),
              TextButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text("Próximo"),
                onPressed: (){},

              ),
            ],
          ),
          height: 60,
        ),
        elevation: 50,
      ),
      /*bottomNavigationBar: 
      BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: "Anterior"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: "Anterior"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: "Próximo"
          )
        ],
      ),*/
    );
  }
}
