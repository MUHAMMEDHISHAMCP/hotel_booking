import 'package:flutter/material.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_controller.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_otp_controller.dart';
import 'package:hotel_book/app/signup/model/signup_model.dart';
import 'package:hotel_book/app/signup/services/signup_services.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/widgets/bottomnav.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool isLoading = false;

  bool _isObscure = true;
  get isObscure => _isObscure;
  set isObscure(value) {
    _isObscure = value;
    notifyListeners();
  }

  void signUp(context) async {
    final mobNo = Provider.of<MobileNoController>(context, listen: false);
    final mobOtp = Provider.of<MobOtpController>(context, listen: false);

    // print(mobNo.mobNoController.text);
    // print(emailController.text);
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final SignUpModel userDatas = SignUpModel(
        name: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: mobNo.mobNoController.text,
      );
      SignUpResponse response = await SignUpServices().singnUpRepo(userDatas);

      if (response.created == true) {
        final pref = await SharedPreferences.getInstance();
        await pref.setBool('saveValue', true);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const BottomNav(),
            ),
            (route) => false);
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Sign Up Succesfully', mainColor));
        mobNo.mobNoController.clear();
        mobOtp.mobOtpController.clear();
        isLoading = false;
        notifyListeners();
      } else if (response.created != true) {
        ScaffoldMessenger.of(context).showSnackBar(
          ShowDialogs.popUp(
            '${response.message}',
          ),
        );
      }
    }
  }

  String? nameValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your name';
    }
    return null;
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

  String? confirmPasswordValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Confirm Password';
    }
    if (fieldContent != passwordController.text) {
      return 'Password Not Match';
    }
    return null;
  }

  // void _isLoadingFalse() {
  //   isLoading = false;
  //   notifyListeners();
  // }

  void disposes() {
    formKey.currentState!.reset();
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmController.clear();
    _isObscure = true;
    isLoading = false;
    notifyListeners();
  }
}
