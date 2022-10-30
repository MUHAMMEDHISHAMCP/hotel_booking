import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_book/app/mobile_otp/model/mobile_otp.dart';
import 'package:hotel_book/app/mobile_otp/services/mobile_no_service.dart';
import 'package:hotel_book/app/mobile_otp/view/otp_screen.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';

class MobileNoController extends ChangeNotifier {
  final mobNoController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  bool isLoading = false;
  String? id;
  String hash ="";

 void mobileSignIn(context) async {
    if (key.currentState!.validate()) {
      isLoading =true;
      notifyListeners();
      MobNoModel userNumber = MobNoModel(
        phoneNumber: mobNoController.text,
      );
      MobNoResponse? mobNoResponse = await MobNoRepo().loginService(userNumber);
      // print(id);
      if (mobNoResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response'));
        isLoading = false;

        return;
      }
      if (mobNoResponse.success == true) {
        hash = mobNoResponse.hash??'';
        // final pref = await SharedPreferences.getInstance();
        // await pref.setBool('saveValue', true);
   ScaffoldMessenger.of(context).showSnackBar(
          ShowDialogs.popUp(
            mobNoResponse.message.toString(),
            mainColor,
          ),
   );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OtpScreen(),
          ),
        );
        isLoading= false;
        notifyListeners();
      } else {
        log(mobNoResponse.message.toString());
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          ShowDialogs.popUp(
            mobNoResponse.message.toString(),
          ),
        );
      }
    }
  }

  String? mobNoValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your Mobile Number';
    }
    if (fieldContent.length < 10) {
      return 'Requires atleast 10 digit';
    }
    return null;
  }
}
