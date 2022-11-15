import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_book/app/login/model/login.dart';
import 'package:hotel_book/app/login/services/login_repo.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/strings.dart';
import 'package:hotel_book/app/widgets/bottomnav.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailOrPhneController = TextEditingController();
  bool isLoading = false;

  void logIn(context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      LoginModel userData = LoginModel(
        email: emailOrPhneController.text,
        password: passwordController.text,
      );
      // print(emailController.text);
      // print(passwordController.text);

      LogInResponse? response = await LoginRepo().loginService(userData);

      if (response!.isSuccess == true) {
        await _storeUserData(response);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const BottomNav(),
            ),
            (route) => false);

        //   Navigations.pushRemoveUntil(BottomNav);
        ShowDialogs.popUp('Sign In Succesfully', mainColor);

        emailOrPhneController.clear();
        passwordController.clear();
        isLoading = false;
        notifyListeners();
      } else {
        log(response.message.toString());
        isLoading = false;
        notifyListeners();
        ShowDialogs.popUp(
          response.message.toString(),
        );
      }
    }
  }

  String? emailValidator(String? fieldContent) {
    if (fieldContent == null || fieldContent.isEmpty) {
      return 'Please fill the field';
    } else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(fieldContent) &&
        !RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
            .hasMatch(fieldContent)) {
      return 'Enter a valid email / phone number';
    }
    return null;
  }

  String? passwordValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your password';
    }
    if (fieldContent.length < 6) {
      return 'Requires atleast 6 characters';
    }
    return null;
  }

  Future<void> _storeUserData(LogInResponse data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(KStrings.isLogggedIn, true);
    await pref.setString(KStrings.userName, data.profile?.name ?? '');
    await pref.setString(KStrings.email, data.profile?.email ?? '');
    await pref.setString(KStrings.token, data.profile?.token ?? '');
  }
}
