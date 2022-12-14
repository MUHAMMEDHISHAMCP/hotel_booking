import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_book/app/account/controller/setting_controller.dart';
import 'package:hotel_book/app/home/controller/home_controller.dart';
import 'package:hotel_book/app/home/controller/search_controller.dart';
import 'package:hotel_book/app/hotels/controller/hotel_controller.dart';
import 'package:hotel_book/app/hotels/controller/room_available.dart';
import 'package:hotel_book/app/login/controller/login.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_controller.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_otp_controller.dart';
import 'package:hotel_book/app/signup/controller/signup.dart';
import 'package:hotel_book/app/splash/view/splash_screen.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/navigations.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: mainColor,
  ));
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
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingProvider(),
        ),
          ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Navigations.navigatorKey,
        scaffoldMessengerKey: ShowDialogs.scaffoldMessengerKey,
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
