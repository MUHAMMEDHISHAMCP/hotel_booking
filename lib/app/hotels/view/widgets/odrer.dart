import 'package:flutter/material.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      // color: mainColor,
      height: MediaQuery.of(context).size.height / 11.5,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                MainTitle(
                  text: 'Total',
                  fontSize: 18,
                  weight: FontWeight.w600,
                  color: subColor,
                ),
                MainTitle(
                  text: '  ₹ 999',
                  fontSize: 18,
                  weight: FontWeight.bold,
                  color: subColor,
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(3),
                  backgroundColor: MaterialStateProperty.all(subColor),
                  shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ))),
              onPressed: () {},
              child: const Text(
                'Order now',
                style: TextStyle(color: kBlack,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}