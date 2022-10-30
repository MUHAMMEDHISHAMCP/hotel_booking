import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/home/view/widgets/choice_chip.dart';
import 'package:hotel_book/app/hotels/controller/hotel_controller.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class HotelDetails extends StatelessWidget {
  HotelDetails({Key? key, required this.hotels}) : super(key: key);
  final AllRoomsModel hotels;
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
          Stack(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Image(
                      image: NetworkImage(
                          hotels.images!.first[1].url.toString()))),
              Positioned(
                right: 10,
                bottom: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_sharp,
                    color: subColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          kHeight15,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainTitle(
                      text: hotels.property!.propertyName ?? 'No name',
                      fontSize: 20,
                      weight: FontWeight.bold,
                      lines: 2,
                    ),
                    MainTitle(
                      text: '₹ ${hotels.price}',
                      fontSize: 18,
                      color: kBlack,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainTitle(
                      text: hotels.property!.street ?? 'Place Not Available',
                      fontSize: 16,
                      weight: FontWeight.w300,
                    ),
                    const MainTitle(
                      text: 'Daily',
                      fontSize: 16,
                      weight: FontWeight.w300,
                    )
                  ],
                ),
                kheight10,
                const MainTitle(
                  text: 'Description',
                  fontSize: 16,
                  weight: FontWeight.bold,
                ),
                kheight10,
                Text(
                  hotels.property!.propertyDetails ?? 'sj',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
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
                          ? 'Pre Booking'
                          : '  ${prov.updatedDate?.day} - '
                              '${prov.updatedDate?.month} - '
                              '${prov.updatedDate?.year}',
                      textStyle: const TextStyle(color: kBlack),
                      onClick: (value) {
                        prov.setState('datePick');
                        prov.selectDate(context);
                      },
                      selected: prov.updatedDate == null
                          ? false
                          : prov.type == 'datePick'
                              ? true
                              : false,
                    ),
                  ],
                ),
                kHeight5,
                const MainTitle(
                  text: 'Advance Booking',
                  fontSize: 20,
                  weight: FontWeight.bold,
                ),
                kHeight15,
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          prov.startingDate(context);
                        },
                        child: Column(
                          children: [
                            const MainTitle(
                              text: 'From',
                              fontSize: 14,
                              weight: FontWeight.w300,
                            ),
                            MainTitle(
                              text: prov.startDate == null
                                  ? 'Select a date'
                                  : '${prov.startDate?.day} - '
                                      '${prov.startDate?.month} - '
                                      '${prov.startDate?.year}',
                              fontSize: 15,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      //  MainTitle(
                      //   text: prov.startDate == null ? '':'to',
                      //   fontSize: 15,
                      //   color: kBlack,
                      //   weight: FontWeight.bold,
                      // ),
                      const VerticalDivider(
                        thickness: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          prov.endingDate(context);
                        },
                        child: prov.startDate == null
                            ? const SizedBox()
                            : Column(
                                children: [
                                  const MainTitle(
                                    text: 'To',
                                    fontSize: 14,
                                    weight: FontWeight.w300,
                                  ),
                                  MainTitle(
                                    text: prov.endDate == null
                                        ? 'Select a date'
                                        : '${prov.endDate?.day} - '
                                            '${prov.endDate?.month} - '
                                            '${prov.endDate?.year}',
                                    fontSize: 15,
                                    color: kBlack,
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          kHeight20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                kheight10,
                SizedBox(
                  width: double.infinity,
                  height: 40,
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
