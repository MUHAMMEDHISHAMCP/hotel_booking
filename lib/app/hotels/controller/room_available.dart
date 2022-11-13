import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_book/app/hotels/model/room_available.dart';
import 'package:hotel_book/app/hotels/services/room_check_repo.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';

class RoomAvailabilityProvider extends ChangeNotifier {
  bool isLoading = false;

  void roomAvailabilityCheck(context, String hotelId, String startDate,
      String endDate, int roomCount) async {
    isLoading = true;
    notifyListeners();
    RoomAvailableModel roomDetails = RoomAvailableModel(
      hotelId: hotelId,
      startDate: startDate,
      endDate: endDate,
      roomsCount: 99,
    );
    print(startDate);
    // print(emailController.text);
    // print(passwordController.text);

    RoomAvailabilityResponseModel? response =
        await RoomAvailableService().roomAvailableRepo(roomDetails);
    log('=====================');
    if (response!.isAvailable == true) {
      log('sinan');
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        ShowDialogs.popUp('kdjaslfk', mainColor),
      );
    } else {
      // log(response.message.toString());
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        ShowDialogs.popUp(
          response.message.toString(),
        ),
      );
    }
  }
}
