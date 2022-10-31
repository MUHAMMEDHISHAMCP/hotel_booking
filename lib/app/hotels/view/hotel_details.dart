import 'package:flutter/material.dart';
import 'package:hotel_book/app/cart/view/widgets/order.dart';
import 'package:hotel_book/app/home/controller/home_controller.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/home/view/widgets/choice_chip.dart';
import 'package:hotel_book/app/hotels/controller/hotel_controller.dart';
import 'package:hotel_book/app/hotels/view/widgets/more_detials.dart';
import 'package:hotel_book/app/hotels/view/widgets/odrer.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class HotelDetails extends StatelessWidget {
  HotelDetails({Key? key, required this.hotels,})
      : super(key: key);
  final AllRoomsModel hotels;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prov = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: kBlack,
                )),
            backgroundColor: backgroundColor,
            title: const MainTitle(
              text: 'Room Details',
              fontSize: 22,
              color: kBlack,
              weight: FontWeight.w500,
            ),
          ),
        ],
        body: ListView(
          shrinkWrap: true,
           physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/2.5,
              child: PageView.builder(
              //  pageSnapping: false,
                itemCount: hotels.images!.first.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => 
                 Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                          // bottomLeft: Radius.circular(20),
                          // bottomRight: Radius.circular(20)
                        ),
                        child: prov.isLoading == true ?CircularProgressIndicator(): Image(
                          image: NetworkImage(
                            hotels.images!.first[index].url.toString(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 30,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: kBlack,
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_sharp,
                              color: subColor,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width / 1.5,
                        child: MainTitle(
                          text: hotels.property!.propertyName ?? 'No name',
                          fontSize: 20,
                          weight: FontWeight.bold,
                          lines: 2,
                          align: TextAlign.start,
                        ),
                      ),
                      MainTitle(
                        text: '₹ ${hotels.price}',
                        fontSize: 18,
                        color: kBlack,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  kHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width / 1.7,
                        child: MainTitle(
                          text: hotels.property!.address ??
                              'Address Not Available',
                          fontSize: 16,
                          weight: FontWeight.w300,
                          lines: 4,
                          align: TextAlign.start,
                        ),
                      ),
                      // const MainTitle(
                      //   text: 'Daily',
                      //   fontSize: 16,
                      //   weight: FontWeight.w300,
                      // )
                      SizedBox(
                        // width: 100,
                        child: TextButton(
                          onPressed: () {
                            print(hotels.images);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MoreDetails(
                                  details: hotels,
                                ),
                              ),
                            );
                          },
                          child: const MainTitle(
                            text: 'More Details ➮',
                            fontSize: 16,
                            weight: FontWeight.bold,
                          ),
                        ),
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
                    hotels.category?.description ?? 'No description',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  kHeight15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const MainTitle(
                            text: 'Room Name',
                            fontSize: 14,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: size.width / 5,
                            child: MainTitle(
                              text: hotels.roomName ?? 'Name not available',
                              fontSize: 15,
                              weight: FontWeight.w400,
                              align: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const MainTitle(
                            text: 'Room type',
                            fontSize: 14,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: size.width / 3,
                            child: MainTitle(
                              text: hotels.roomType ?? 'Not available',
                              fontSize: 15,
                              color: kBlack,
                              weight: FontWeight.w400,
                              align: TextAlign.center,
                              lines: 2,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const MainTitle(
                            text: 'Allowed guest',
                            fontSize: 14,
                            weight: FontWeight.bold,
                            align: TextAlign.center,
                          ),
                          MainTitle(
                            text: hotels.guest.toString(),
                            fontSize: 15,
                            color: kBlack,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  kheight10,
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const MainTitle(
                              text: 'Checkin time',
                              fontSize: 14,
                              weight: FontWeight.w400,
                            ),
                            MainTitle(
                              text: hotels.checkinTime ??
                                  'Time not available',
                              fontSize: 15,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          thickness: 4,
                          color: Colors.black45,
                        ),
                        Column(
                          children: [
                            const MainTitle(
                              text: 'Checkout Time',
                              fontSize: 14,
                              weight: FontWeight.w400,
                            ),
                            MainTitle(
                              text: hotels.checkoutTime ??
                                  'Time not available',
                              fontSize: 15,
                              color: kBlack,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  kHeight15,
                  // const MainTitle(
                  //   text: 'Booking',
                  //   fontSize: 18,
                  //   weight: FontWeight.bold,
                  // ),
                  // kheight10,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     ChoiceChipWidget(
                  //       text: 'Today',
                  //       textStyle: const TextStyle(color: kBlack),
                  //       onClick: (value) {
                  //         prov.setState('Today');
                  //         prov.updatedDate = null;
                  //       },
                  //       selected: prov.type == 'Today' ? true : false,
                  //     ),
                  //     ChoiceChipWidget(
                  //       text: 'Tomorrow',
                  //       textStyle: const TextStyle(color: kBlack),
                  //       onClick: (value) {
                  //         prov.setState('Tomorrow');
                  //         prov.updatedDate = null;
                  //       },
                  //       selected: prov.type == 'Tomorrow' ? true : false,
                  //     ),
                  //     ChoiceChipWidget(
                  //       text: prov.updatedDate == null
                  //           ? 'Pre Booking'
                  //           : '  ${prov.updatedDate?.day} - '
                  //               '${prov.updatedDate?.month} - '
                  //               '${prov.updatedDate?.year}',
                  //       textStyle: const TextStyle(color: kBlack),
                  //       onClick: (value) {
                  //         prov.setState('datePick');
                  //         prov.selectDate(context);
                  //       },
                  //       selected: prov.updatedDate == null
                  //           ? false
                  //           : prov.type == 'datePick'
                  //               ? true
                  //               : false,
                  //     ),
                  //   ],
                  // ),
                  // kHeight5,
                  // const MainTitle(
                  //   text: 'Advance Booking',
                  //   fontSize: 20,
                  //   weight: FontWeight.bold,
                  // ),
                  // kHeight15,
                  //     IntrinsicHeight(
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           InkWell(
                  //             onTap: () {
                  //               prov.startingDate(context);
                  //             },
                  //             child: Column(
                  //               children: [
                  //                 const MainTitle(
                  //                   text: 'From',
                  //                   fontSize: 14,
                  //                   weight: FontWeight.w300,
                  //                 ),
                  //                 MainTitle(
                  //                   text: prov.startDate == null
                  //                       ? 'Select a date'
                  //                       : '${prov.startDate?.day} - '
                  //                           '${prov.startDate?.month} - '
                  //                           '${prov.startDate?.year}',
                  //                   fontSize: 15,
                  //                   weight: FontWeight.bold,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           //  MainTitle(
                  //           //   text: prov.startDate == null ? '':'to',
                  //           //   fontSize: 15,
                  //           //   color: kBlack,
                  //           //   weight: FontWeight.bold,
                  //           // ),
                  //           const VerticalDivider(
                  //             thickness: 2,
                  //           ),
                  //           GestureDetector(
                  //             onTap: () {
                  //               prov.endingDate(context);
                  //             },
                  //             child: prov.startDate == null
                  //                 ? const SizedBox()
                  //                 : Column(
                  //                     children: [
                  //                       const MainTitle(
                  //                         text: 'To',
                  //                         fontSize: 14,
                  //                         weight: FontWeight.w300,
                  //                       ),
                  //                       MainTitle(
                  //                         text: prov.endDate == null
                  //                             ? 'Select a date'
                  //                             : '${prov.endDate?.day} - '
                  //                                 '${prov.endDate?.month} - '
                  //                                 '${prov.endDate?.year}',
                  //                         fontSize: 15,
                  //                         color: kBlack,
                  //                         weight: FontWeight.bold,
                  //                       ),
                  //                     ],
                  //                   ),
                  //           ),
                  //         ],
                  //       ),
                  //     )
                ],
              ),
            ),
            kHeight20,
          ],
        ),
      ),
    bottomSheet: GestureDetector(
      child: Container(
        height: 50,
    width: double.infinity,
           decoration: const BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
                child:const Center(child: MainTitle(text: 'Book Now', fontSize:20,align: TextAlign.center,weight: FontWeight.w700,)),
      ),
    ),
    );
  }
}
