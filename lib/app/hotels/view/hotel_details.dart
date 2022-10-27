import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/view/widgets/choice_chip.dart';
import 'package:hotel_book/app/hotels/controller/hotel_controller.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class HotelDetails extends StatelessWidget {
  HotelDetails({Key? key}) : super(key: key);

  final List<String> imageList = [
    'assets/peri peri.png',
    'assets/beef mandi.png',
    'assets/mandi.png',
    'assets/peri peri.png',
    'assets/beef mandi.png',
    'assets/mandi.png',
    'assets/peri peri.png',
    'assets/beef mandi.png',
    'assets/mandi.png',
    'assets/beef mandi.png',
  ];

  final List<String> itemList = [
    'Peri peri alfahm',
    'Beef Mandi',
    'Chicken Mandi',
    'Peri peri alfahm',
    'Beef Mandi',
    'Chicken Mandi',
    'Peri peri alfahm',
    'Beef Mandi',
    'Chicken Mandi',
    'jhgfd',
  ];

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HotelController>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Image.asset('assets/hoteldetails.png'),
          ),
          kHeight15,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainTitle(
                  text: 'Navarathna',
                  fontSize: 20,
                  weight: FontWeight.bold,
                ),
                const MainTitle(
                  text: 'Thalassery',
                  fontSize: 16,
                  weight: FontWeight.w300,
                ),
                kheight10,
                const MainTitle(
                  text: 'Description',
                  fontSize: 16,
                  weight: FontWeight.bold,
                ),
                kheight10,
                const Text(
                  'dsaklkewuhdsjo  ygfe dsau9afds9c8yfds afdsag c98yafdscxcbxzl8efawscgudxpawfsdcxjydsu 8ydfshcuhpwfdash8eadscu8xhhraefuhsdci 8dashchadschyuci ',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                kHeight15,
                const MainTitle(
                  text: 'Booking',
                  fontSize: 18,
                  weight: FontWeight.bold,
                ),
                kheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChoiceChipWidget(
                      text: 'Today',
                      textStyle: const TextStyle(color: kBlack),
                      onClick: (value) {
                        prov.setState('Today');
                        prov.updatedDate = null;
                      },
                      selected: prov.type == 'Today' ? true : false,
                    ),
                    ChoiceChipWidget(
                      text: 'Tomorrow',
                      textStyle: const TextStyle(color: kBlack),
                      onClick: (value) {
                        prov.setState('Tomorrow');
                        prov.updatedDate = null;
                      },
                      selected: prov.type == 'Tomorrow' ? true : false,
                    ),
                    ChoiceChipWidget(
                      text: prov.updatedDate == null
                          ? 'Select a date'
                          : '  ${prov.updatedDate?.day} - '
                              '${prov.updatedDate?.month} - '
                              '${prov.updatedDate?.year}',
                      textStyle: const TextStyle(color: kBlack),
                      onClick: (value) {
                        prov.setState('datePick');
                        prov.selectDate(context);
                      },
                      selected: prov.type == 'datePick' ? true : false,
                    ),
                  ],
                ),
              ],
            ),
          ),
          kHeight30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                   height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      // value.formKey.currentState!.validate();
                    },
                    style: ElevatedButton.styleFrom(primary: kBlack),
                    child: const MainTitle(
                      text: 'Add to wishlist',
                      fontSize: 20,
                      color: subColor,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
                kheight10,
                SizedBox(
                  width: double.infinity,
               height: 35,
              child: ElevatedButton(
                onPressed: () {
                  // value.formKey.currentState!.validate();
                },
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                ),
                child: const MainTitle(
                  text: 'Book Now',
                  fontSize: 20,
                  color: subColor,
                  weight: FontWeight.w400,
                ),
              ),
            ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
