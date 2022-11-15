import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_book/app/hotels/model/booking/bookingmodel.dart';
import 'package:hotel_book/app/hotels/model/booking/bookingrespons.dart';
import 'package:hotel_book/app/hotels/model/room_availability/room_available.dart';
import 'package:hotel_book/app/hotels/services/booking.dart';
import 'package:hotel_book/app/hotels/services/room_check_repo.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/navigations.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';

class BookingProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isAvailable = false;

  void roomAvailabilityCheck(context, String hotelId, DateTime startDate,
      DateTime endDate, int roomCount) async {
    isLoading = true;
    notifyListeners();
    RoomAvailableModel roomDetails = RoomAvailableModel(
      hotelId: hotelId,
      startDate: startDate,
      endDate: endDate,
      roomsCount: roomCount,
    );

  //  print(endDate);
    // print(emailController.text);
    // print(passwordController.text);

    RoomAvailabilityResponseModel? response =
        await RoomAvailableService().roomAvailableRepo(roomDetails);
    log('=====================');
    if (response!.isAvailable == true) {
      isLoading = false;
      notifyListeners();
      // Navigations.pop();
      ShowDialogs.popUp(
        "Room Available",
        mainColor,
      );
      getRoomData(context, hotelId, startDate, endDate, roomCount);
      isLoading = false;
      notifyListeners();
    } else {
      // log(response.message.toString());
      isLoading = false;
      notifyListeners();
       Navigations.pop();
      ShowDialogs.popUp(
        'Room Not Available',
      );
      isLoading = false;
      notifyListeners();
    }
  }


    void getRoomData(context, String hotelId, DateTime startDate,
      DateTime endDate, int roomCount) async {
        print(endDate);
    BookingModel roomDetails = BookingModel(hotel: hotelId, start: startDate.toString(), room: roomCount, end: endDate.toString());

    BookingResponse? response =
        await BookingServices().BookingRepo(roomDetails);
    if (response!.success == true) {
       log('response.message.toString()');
       isAvailable =true;
       notifyListeners();
   // log('response');
      // log('sldhj')
    } else {
    
    }
  }


}
