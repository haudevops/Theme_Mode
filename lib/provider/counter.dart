import 'package:flutter/material.dart';

class ProviderCounter extends ChangeNotifier{
  int _counter = 50;
  String _text = 'Click';
  Color _color = Colors.blue;

  int get counter => _counter;
  String get text => _text;
  Color get color => _color;

  void incrementCounter(){
    _counter++;
    notifyListeners();
  }

  void decrementCounter(){
    _counter--;
    notifyListeners();
  }

  void changeText(){
    if(_text == 'Hau Handsome'){
      _text = 'This is';
    }else{
      _text = 'Hau Handsome';
    }
    notifyListeners();
  }

  void changeColor(){
    if(_color == Colors.blue){
      _color = Colors.orange;
    }else{
      _color = Colors.blue;
    }
    notifyListeners();
  }
}