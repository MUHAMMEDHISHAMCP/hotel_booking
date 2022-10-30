import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/controller/home_controller.dart';
import 'package:hotel_book/app/hotels/controller/hotel_controller.dart';
import 'package:hotel_book/app/login/controller/login.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_controller.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_otp_controller.dart';
import 'package:hotel_book/app/signup/controller/signup.dart';
import 'package:hotel_book/app/splash/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => HotelController(),
        ),
          ChangeNotifierProvider(
          create: (context) => MobileNoController(),
        ),
          ChangeNotifierProvider(
          create: (context) => MobOtpController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
