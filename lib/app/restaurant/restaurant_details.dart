import 'package:flutter/material.dart';
import 'package:hotel_book/app/restaurant/widgets/food_details.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';

class RestaurantDetails extends StatelessWidget {
  RestaurantDetails({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              // decoration: const BoxDecoration(
              //     image:
              //         DecorationImage(image: AssetImage('assets/nahdi1.png'))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Image.asset('assets/nahdi1.png'),
              ),
            ),
            kHeight20,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MainTitle(
                    text: 'Nahdi Restaurant',
                    fontSize: 20,
                    weight: FontWeight.bold,
                  ),
                  MainTitle(
                    text: 'Perinthalmanna',
                    fontSize: 16,
                    weight: FontWeight.w300,
                  ),
                  kHeight20,
                  MainTitle(
                    text: 'Description',
                    fontSize: 16,
                    weight: FontWeight.bold,
                  ),
                  kheight10,
                  Text(
                    'dsaklkewuhdsjo  ygfe dsau9afds9c8yfds afdsag c98yafdscxcbxzl8efawscgudxpawfsdcxjydsu 8ydfshcuhpwfdash8eadscu8xhhraefuhsdci 8dashchadschyuci ',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  //  MainTitle(
                  //   text:
                  //       'Nahdi Restaurantiahhfu;dvbc  dsfhohfdsohoi ihfsd oihfd svhovdsbcousbdvjcl x;ogdsbcjhivsdcxj gfsvdoufsvbcufsjdcnvsbcjodscbjbv;dsucbjkv;dsbucbjb;dsvcjknvudsbjckv;dsucbk n;ogudsvcbjk;dfusvcbnb;dfsvucbhnbvdshcbnusdhcbngludsvlcbhn',
                  //   fontSize: 20,
                  //   weight: FontWeight.w400,
                  // ),
                  kHeight20,
                  MainTitle(
                    text: 'Items',
                    fontSize: 18,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            LimitedBox(
              maxHeight: 200,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    imageList.length,
                    (index) => FoodMenu(
                          imageList: imageList[index],
                          title:itemList[index],
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
