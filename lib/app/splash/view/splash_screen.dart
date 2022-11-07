import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotel_book/app/login/view/loginpage.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/widgets/bottomnav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Timer(
        const Duration(seconds: 3),
        () => checkLogIn(context),
      );
  
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/fhlogo.png',
              height: MediaQuery.of(context).size.height / 4.5,
            ),
            // DefaultTextStyle(
            //   style: const TextStyle(
            //       fontSize: 30.0,
            //       fontFamily: 'Mainfont',
            //       letterSpacing: 2,
            //       fontWeight: FontWeight.w400),
            //   child: AnimatedTextKit(
            //     totalRepeatCount: 1,
            //     animatedTexts: [
            //       TypewriterAnimatedText(
            //         'FOODHUB',
            //         speed: const Duration(milliseconds: 230),
            //         cursor: '',
            //         curve: Curves.easeOut,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  checkLogIn(context) async {
    final pref = await SharedPreferences.getInstance();
    final check = pref.getBool('saveValue');

    if (check == false || check == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    }
  }
}
