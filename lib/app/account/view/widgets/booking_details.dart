import 'package:flutter/material.dart';
import 'package:hotel_book/app/account/controller/setting_controller.dart';
import 'package:hotel_book/app/home/view/widgets/choice_chip.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:provider/provider.dart';

class BookingDetials extends StatelessWidget {
  const BookingDetials({super.key});

  @override
  Widget build(BuildContext context) {
final prov = context.watch<SettingsProvider>();
    return Scaffold(
      body: ListView(
        children: [
          kheight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChipWidget(
                text: 'Booked',
                textStyle: const TextStyle(color: kBlack),
                onClick: (bool value) {
                   prov.setState('Booked');
                },
                selected: prov.type == "Booked"?true: false,
              ),
              ChoiceChipWidget(
                text: 'Completed',
                textStyle: const TextStyle(color: kBlack),
                onClick: (bool value) {
                  prov.setState('Completed');
                },
                selected: prov.type == "Completed"?true:false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
