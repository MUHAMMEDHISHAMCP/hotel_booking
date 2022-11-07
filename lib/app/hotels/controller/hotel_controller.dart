import 'package:flutter/material.dart';

class HotelController extends ChangeNotifier {
  DateTime? updatedDate;
  DateTime? startDate;
  DateTime? endDate;
  DateTime todayDate = DateTime.now();
  DateTime tmrwDate = DateTime.now().add(const Duration(days: 1));
  int? days;
  int c = 0;

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
    c = bookingDate.end.day - bookingDate.start.day;
    notifyListeners();
    if (c <= 0) {
      c = c+30;
      notifyListeners();
    }
    print(c);
  }
  // final tempDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(const Duration(days: 30 * 2)));

}
