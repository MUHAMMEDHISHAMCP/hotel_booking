import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_book/app/login/model/login.dart';
import 'package:hotel_book/app/login/services/login_repo.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/widgets/bottomnav.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool isLoading = false;

  void logIn(context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      LoginModel userData = LoginModel(
        email: emailController.text,
        password: passwordController.text,
      );
      // print(emailController.text);
      // print(passwordController.text);

      LoginResponse? response = await LoginRepo().loginService(userData);

      if (response!.created == true) {
        final pref = await SharedPreferences.getInstance();
        await pref.setBool('saveValue', true);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const BottomNav(),
            ),
            (route) => false);
        ScaffoldMessenger.of(context).showSnackBar(
          ShowDialogs.popUp('Sign In Succesfully', mainColor),
        );
        emailController.clear();
        passwordController.clear();
        isLoading = false;
        notifyListeners();
      } else {
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

  String? emailValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(fieldContent)) {
      return 'Enter a valid email';
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
}
