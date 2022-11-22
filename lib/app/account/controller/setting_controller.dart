import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier{


  String _type = "Booked";
  bool isClicked = false;
  get type => _type;

  setState(value) {
    _type = value;
    notifyListeners();
  }





}