import 'package:flutter/material.dart';
import 'package:hotel_book/app/login/view/loginpage.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_controller.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_controller.dart';
import 'package:hotel_book/app/signup/view/signup.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class MobileNoScreen extends StatelessWidget {
  const MobileNoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mobileController = Provider.of<MobileNoController>(context,listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: mobileController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: mobileController.mobNoController,
                decoration: InputDecoration(
                  labelText: "Enter Mobile Number ",
                  labelStyle: const TextStyle(color: mainColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColor),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: mobileController.mobNoValidator,
              ),
              kHeight20,
              Consumer<MobileNoController>(
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    value.mobileSignIn(context);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) =>  SignUpScreen(),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                    primary: const Color.fromRGBO(47, 173, 103, 1),
                  ),
                  child: const MainTitle(
                    text: 'GET OTP',
                    fontSize: 16,
                    color: subColor,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          kwidth10,
          const Text('ALREADY ON ACCOUNT?'),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LogInScreen(),
                ),
                (route) => false,
              );
              // value.emailController.clear();
              // value.passwordController.clear();
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
