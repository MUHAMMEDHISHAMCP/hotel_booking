import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_book/app/hotels/model/room_available.dart';
import 'package:hotel_book/app/hotels/services/room_check_repo.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/navigations.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';

class RoomAvailabilityProvider extends ChangeNotifier {
  bool isLoading = false;

  void roomAvailabilityCheck(context, String hotelId, DateTime startDate,
      DateTime endDate, int roomCount) async {
    isLoading = true;
    notifyListeners();
    RoomAvailableModel roomDetails = RoomAvailableModel(
      hotelId: hotelId,
      startDate: startDate,
      endDate: endDate,
      roomsCount: 99,
    );
    print(endDate);
    // print(emailController.text);
    // print(passwordController.text);

    RoomAvailabilityResponseModel? response =
        await RoomAvailableService().roomAvailableRepo(roomDetails);
    log('=====================');
    if (response!.isAvailable == true) {
      log('sldhj');
      isLoading = false;
      notifyListeners();
        Navigations.pop();
      ShowDialogs.popUp("Room Available",mainColor);
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
}
