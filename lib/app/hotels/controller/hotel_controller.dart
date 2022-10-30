import 'package:flutter/material.dart';

class HotelController extends ChangeNotifier {
  DateTime? updatedDate;
  DateTime? startDate;
  DateTime? endDate;
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
        lastDate: DateTime.now().add(const Duration(days: 30 * 2)));
    if (tempDate == null) {
      return;
    }

    updatedDate = tempDate;
    // startDate = tempDate;
    // endDate = tempDate;
    notifyListeners();
  }

  startingDate(context) async {
    final tempDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 30 * 2),
      ),
    );
    if (tempDate == null) {
      return;
    }

    // updatedDate = tempDate;
    startDate = tempDate;
    // endDate =tempDate;
    notifyListeners();
  }

  void endingDate(context) async {
    if (startDate != null) {
      final tempDate = await showDatePicker(
        context: context,
        initialDate: startDate!.add(
          const Duration(days: 2),
        ),
        firstDate: startDate!.add(
          const Duration(days: 2),
        ),
        lastDate: startDate!.add(
          const Duration(days: 15),
        ),
      );
      if (tempDate == null) {
        return;
      }

      endDate = tempDate;
      notifyListeners();
    }
  }
  // final tempDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(const Duration(days: 30 * 2)));

}
