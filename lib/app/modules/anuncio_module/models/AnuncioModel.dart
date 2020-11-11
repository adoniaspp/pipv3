
import 'package:flutter/material.dart';

class AnuncioModel with ChangeNotifier{
  
  Color colorButton1 = Colors.black;
  double borderButton1 = 1;
  Color colorButton2 = Colors.black;
  double borderButton2 = 1;

  void selectButton1(){
      colorButton1 = Colors.green;
      borderButton1 = 8;
      colorButton2 = Colors.black;
      borderButton2 = 1;
      notifyListeners();
  }

  void selectButton2(){
      colorButton2 = Colors.green;
      borderButton2 = 8;    
      colorButton1 = Colors.black;
      borderButton1 = 1;  
      notifyListeners();
  }
}