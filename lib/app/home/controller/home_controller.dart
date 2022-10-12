import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{

    String _type = "All";
  bool isClicked = false;
  get type => _type;

  setState(value) {
    _type = value;
    notifyListeners();
  }
}