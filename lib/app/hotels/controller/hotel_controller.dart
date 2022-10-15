import 'package:flutter/material.dart';

class HotelController extends ChangeNotifier {
  DateTime? updatedDate;
  String _type = "All";
  bool isClicked = false;
  get type => _type;

  setState(value) {
    _type = value;
    notifyListeners();
  }

  selectDate(context) async {
    final tempDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate:  DateTime.now().add(const Duration(days: 30*2)));
    if (tempDate == null) {
      return;
    }

    updatedDate = tempDate;
    notifyListeners();
  }
}
