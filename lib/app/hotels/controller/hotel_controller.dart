import 'package:flutter/material.dart';

class HotelController extends ChangeNotifier {
  DateTime? updatedDate;
  DateTime? startDate;
  DateTime? endDate;
  DateTime todayDate = DateTime.now();
  DateTime tmrwDate = DateTime.now().add(const Duration(days: 1));
  int? days;
  int totalDays = 0;
  bool isIncrement = true;

  int count = 0;

  String _type = "Today";
  bool isClicked = false;
  get type => _type;

  void setState(value) {
    _type = value;
    if (startDate != null) {
      _type = 'false';
    }
    notifyListeners();
  }

  void bookingDate(context) async {
    final bookingDate = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(
          const Duration(days: 1),
        ),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 30),
      ),
      helpText: 'Select booking dates',
      cancelText: 'Cancel',
      confirmText: 'Confirm',
      initialEntryMode: DatePickerEntryMode.calendar,
    );

    if (bookingDate == null) {
      return;
    }
    startDate = bookingDate.start;
    endDate = bookingDate.end;
    totalDays = bookingDate.end.day - bookingDate.start.day;
    notifyListeners();
    if (totalDays <= 0) {
      totalDays = totalDays + 30;
      notifyListeners();
    }
  }

  void roomCount(int available) {
    if (isIncrement == true) {
      count++;
      notifyListeners();
      if (count >= available) {
        count = available;
        notifyListeners();
      }
      print(count);
    } else {
      count--;
      notifyListeners();
      if (count <= 0) {
        count = 1;
      }
      print(count);
    }
    
  }
}
  // final tempDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(const Duration(days: 30 * 2)));

