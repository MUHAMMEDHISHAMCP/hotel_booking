import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/controller/home_controller.dart';
import 'package:hotel_book/app/home/controller/search_controller.dart';
import 'package:hotel_book/app/home/view/widgets/all_hotels.dart';
import 'package:hotel_book/app/home/view/widgets/choice_chip.dart';
// import 'package:hotel_book/app/home/view/widgets/category.dart';
import 'package:hotel_book/app/home/view/widgets/location.dart';
import 'package:hotel_book/app/home/view/widgets/resorts.dart';
import 'package:hotel_book/app/home/view/widgets/searchPage.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<HomeProvider>();

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
                  // const SearchField(),
                  GestureDetector(
                    onTap: () {
                      context.read<SearchProvider>().searchController.clear();

                      context.read<SearchProvider>().searchResult.clear();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SearchResult(),
                      ));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: const [
                          kwidth5,
                          Icon(Icons.search_outlined),
                          kwidth5,
                          MainTitle(
                            text: 'Search',
                            fontSize: 18,
                            weight: FontWeight.w300,
                          )
                        ],
                      ),
                    ),
                  ),
                  kheight10,
                  //    SilderWidget(image: 'https://res.cloudinary.com/dzbo5pjhd/image/upload/v1666685014/hotelbooking/Sharafudheen/Delux%20super/bcscqvfwkgc7dtaawc3a.jpg',ratio: 2.2,),
                  // kheight10,
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                  // ),
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChipWidget(
                          text: 'Hotels',
                          textStyle: const TextStyle(color: kBlack),
                          onClick: (bool value) {
                            prov.setState('Hotels');
                          },
                          selected: prov.type == 'Hotels' ? true : false,
                        ),
                        ChoiceChipWidget(
                          text: 'HomeStay',
                          textStyle: const TextStyle(color: kBlack),
                          onClick: (bool value) {
                            prov.setState('HomeStay');
                          },
                          selected: prov.type == 'HomeStay' ? true : false,
                        ),
                        // ChoiceChipWidget(
                        //     text: '',
                        //     textStyle: const TextStyle(color: kBlack),
                        //     onClick: (bool value) {
                        //       prov.setState('All');
                        //     },
                        //     selected: prov.type == 'All' ? true : false,
                        //   ),

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
              kHeight5,
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    kheight10,
                    prov.type == 'Hotels'
                        ? const AllHotelLists()
                        : const AllResorts(),
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
