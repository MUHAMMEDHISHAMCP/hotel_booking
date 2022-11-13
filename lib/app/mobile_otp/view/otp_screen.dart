import 'package:flutter/material.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_controller.dart';
import 'package:hotel_book/app/mobile_otp/controller/mobile_otp_controller.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpController = Provider.of<MobOtpController>(context);
    final mobNoController = Provider.of<MobileNoController>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MainTitle(
              text: 'Verify with OTP',
              fontSize: 22,
              weight: FontWeight.bold,
            ),
            kheight10,
            const MainTitle(
              text: 'Please enter your OTP send to your \n phone number',
              fontSize: 17,
              weight: FontWeight.w400,
            ),
            kHeight30,
            SizedBox(
              width: double.infinity,
              child: Consumer<MobOtpController>(
                builder: (context, value, child) => Pinput(
                  controller: value.mobOtpController,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  defaultPinTheme: PinTheme(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                  ),
                  focusedPinTheme: const PinTheme(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.black38, shape: BoxShape.circle),
                  ),
                  submittedPinTheme: PinTheme(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                      border: Border.all(color: mainColor, width: 3),
                    ),
                  ),
                  length: 6,
                  pinContentAlignment: Alignment.center,
                ),
              ),
            ),
            kHeight30,
            kHeight30,
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(47, 173, 103, 1),
                  ),
                  onPressed: () {
                    otpController.otpVerification(
                      context,
                      mobNoController.mobNoController.text,
                      mobNoController.id,
                    );
                  },
                  child: const MainTitle(
                    text: 'Verify',
                    fontSize: 20,
                    color: subColor,
                    weight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
