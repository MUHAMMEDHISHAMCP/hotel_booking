import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/home/services/all_room.dart';
import 'package:hotel_book/app/services/internet_check.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';

class HomeProvider extends ChangeNotifier {
  List<AllRoomsModel> allRooms = [];
  bool isLoading = false;

  String _type = "Hotels";
  bool isClicked = false;
  get type => _type;

  setState(value) {
    _type = value;
    notifyListeners();
  }

  HomeProvider() {
    getAllRooms();
  }
  void getAllRooms() async {
    if (await InternetCheck.interNetCheck()) {
      isLoading = true;
      notifyListeners();
      AllRoomResponse? roomList = await AllRoomRepo().allRoomServices();
      if (roomList == null) {
        // ScaffoldMessenger.of(context).showSnackBar(
        ShowDialogs.popUp('Something Went Wrong', Colors.redAccent);
        // );
      } else if (roomList.isFailed == true) {
        isLoading = false;
        notifyListeners();
        // ScaffoldMessenger.of(context).showSnackBar(
        ShowDialogs.popUp('Something Went Wrong', Colors.redAccent);
        // );

      } else if (roomList.isFailed != true) {
        allRooms.clear();
        allRooms.addAll(roomList.roomList ?? []);
        isLoading = false;
        notifyListeners();
      } else {
        return;
      }
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      ShowDialogs.popUp('No Internet Connection', Colors.redAccent);
    }
  }
}
