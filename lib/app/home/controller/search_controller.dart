import 'package:flutter/cupertino.dart';
import 'package:hotel_book/app/home/controller/home_controller.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/home/view/widgets/searchPage.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  final searchController = TextEditingController();
  List<AllRoomsModel> searchResult = [];

  void search(context) {
    print(searchController.text);
    final List<AllRoomsModel> list =
        Provider.of<HomeProvider>(context, listen: false).allRooms;
    if (searchController.text.isEmpty || searchController.text == null) {
    searchResult.clear();
    notifyListeners();
    } else {
      final List<AllRoomsModel> result = list
          .where(
            (element) => element.property!.propertyName!.toUpperCase().contains(
                  searchController.text.toUpperCase(),
                ),
          )
          .toList();
           final List<AllRoomsModel> rr = list
          .where(
            (element) => element.property!.street!.toUpperCase().contains(
                  searchController.text.toUpperCase(),
                ),
          )
          .toList();
      searchResult.clear();
      searchResult.addAll(result+rr);
      notifyListeners();
      // print(searchResult.length);
      // print(searchResult[1].property!.propertyName);
      //   print(searchResult[1].property!.street);


      
    }
  }
}
