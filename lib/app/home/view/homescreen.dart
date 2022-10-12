import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/controller/home_controller.dart';
import 'package:hotel_book/app/home/view/widgets/choice_chip.dart';
// import 'package:hotel_book/app/home/view/widgets/category.dart';
import 'package:hotel_book/app/home/view/widgets/location.dart';
import 'package:hotel_book/app/home/view/widgets/hotels.dart';
import 'package:hotel_book/app/home/view/widgets/search.dart';
import 'package:hotel_book/app/home/view/widgets/slider.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider prov = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  const Text(
                    'Take Time To \n Relax',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kheight10,
                  const LocationWidget(),
                  kheight10,
                  const SearchField(),
                  kheight10,
                  const SilderWidget(),
                  kheight10,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceChipWidget(
                          text: 'All',
                          textStyle: const TextStyle(color: kBlack),
                          onClick: (bool value) {
                            prov.setState('All');
                          },
                          selected: prov.type == 'All' ? true : false,
                        ),
                        ChoiceChipWidget(
                          text: 'HomeStay',
                          textStyle: const TextStyle(color: kBlack),
                          onClick: (bool value) {
                            prov.setState('HomeStay');
                          },
                          selected: prov.type == 'HomeStay' ? true : false,
                        ),
                        ChoiceChipWidget(
                          text: 'Hotels',
                          textStyle: const TextStyle(color: kBlack),
                          onClick: (bool value) {
                            prov.setState('Hotels');
                          },
                          selected: prov.type == 'Hotels' ? true : false,
                        ),

                        // MainTitle(
                        //   text: 'Restaurants',
                        //   fontSize: 18,
                        //   weight: FontWeight.w400,
                        // ),
                        // MainTitle(
                        //   text: 'View all ▶',
                        //   fontSize: 12,
                        //   weight: FontWeight.bold,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              kheight10,
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: const [
                    kheight10,
                    HotelLists(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
