import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_controller.dart';
import 'package:hotel_book/app/mobile_otp/model/mobile_verify.dart';
import 'package:hotel_book/app/mobile_otp/services/mobile_otp.dart';
import 'package:hotel_book/app/signup/view/signup.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MobOtpController extends ChangeNotifier {
  final mobOtpController = TextEditingController();
  bool isLoading = false;

void otpVerification(context, mobNo, id) async {
    final mobNoController = Provider.of<MobileNoController>(context,listen: false);
    MobileOtp otp = MobileOtp(
     otp: mobOtpController.text,
     hash: mobNoController.hash,
    );
    MobileOtpResponse response = await MobOtpRepo().verificationService(otp);
    if (response.created == true) {
      // final pref = await SharedPreferences.getInstance();
      // await pref.setBool('saveValue', true);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ),
          (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        ShowDialogs.popUp('OTP verified', mainColor),
      );

      isLoading = false;
      notifyListeners();
    } else {
      print(mobOtpController.text);
      log(response.message.toString());
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
