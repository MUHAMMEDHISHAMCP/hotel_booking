import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/hotels/controller/hotel_controller.dart';
import 'package:hotel_book/app/hotels/controller/room_available.dart';
import 'package:hotel_book/app/hotels/view/widgets/book_room.dart';
import 'package:hotel_book/app/hotels/view/widgets/more_detials.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class HotelDetails extends StatelessWidget {
  HotelDetails({
    Key? key,
    required this.hotels,
  }) : super(key: key);
  final AllRoomsModel hotels;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prov = Provider.of<HotelController>(context);
    context.read<BookingProvider>().initializeRazorPay();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            iconTheme: IconThemeData(color: kBlack),
            floating: true,
            backgroundColor: backgroundColor,
            title: MainTitle(
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
              height: MediaQuery.of(context).size.height / 2.5,
              child: PageView.builder(
               // physics: const BouncingScrollPhysics(),
                controller: controller,
                itemCount: hotels.images!.first.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: hotels.images!.first[index].url.toString(),
                          placeholder: (context, url) => const Image(
                            image: AssetImage('assets/placeholder.png'),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error_outline_outlined),
                        ),
                      ),
                    ),

                    // Positioned(
                    //     right: 30,
                    //     bottom: 30,
                    //     child: IconWidgets(
                    //       icon: Icons.favorite_outline,
                    //       onTap: () {},
                    //     )),

                    // Positioned(
                    //   right: 11,
                    //   top: MediaQuery.of(context).size.height / 6.5,
                    //   child: IconWidgets(
                    //     icon: Icons.arrow_forward,
                    //     onTap: () {
                    //       controller.nextPage(
                    //           duration: const Duration(seconds: 1),
                    //           curve: Curves.bounceOut);
                    //     },
                    //   ),
                    // ),

                    // Positioned(
                    //   left: 10,
                    //   top: MediaQuery.of(context).size.height / 6.5,
                    //   child: IconWidgets(
                    //     icon: Icons.arrow_back,
                    //     onTap: () {
                    //       controller.previousPage(
                    //           duration: const Duration(seconds: 1),
                    //           curve: Curves.bounceIn);
                    //     },
                    //   ),
                    // ),
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
                          weight: FontWeight.w400,
                          lines: 4,
                          align: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        // width: 100,
                        child: TextButton(
                          onPressed: () {
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
                  kHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: hotels.roomNumber! <= 5,
                        child: MainTitle(
                          text: 'Only ${hotels.roomNumber} rooms Available',
                          fontSize: 15,
                          color: Colors.red,
                          weight: FontWeight.w400,
                        ),
                      ),
                      Column(
                        children: [
                          const MainTitle(
                            text: 'No of rooms',
                            fontSize: 14,
                            weight: FontWeight.w400,
                          ),
                          Container(
                              height: 40,
                              // width: MediaQuery.of(context).size.width / 3.5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        prov.isIncrement = false;

                                        prov.roomCount(
                                            hotels.roomNumber!.toInt());
                                      },
                                      icon: const Icon(Icons.remove)),
                                  MainTitle(
                                    text: '${prov.count}',
                                    fontSize: 20,
                                    weight: FontWeight.bold,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        prov.isIncrement = true;
                                        prov.roomCount(
                                            hotels.roomNumber!.toInt());
                                      },
                                      icon: const Icon(Icons.add))
                                ],
                              )),
                        ],
                      ),
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
                              text: hotels.checkinTime ?? 'Time not available',
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
                              text: hotels.checkoutTime ?? 'Time not available',
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
                ],
              ),
            ),
            kHeight20,
          ],
        ),
      ),
      bottomSheet: GestureDetector(
        onTap: () {
          prov.startDate = DateTime.now();
          prov.endDate = DateTime.now().add(const Duration(days: 1));
          prov.updatedDate = null;
          prov.totalDays = 1;
          context.read<BookingProvider>().isAvailable = false;

          //  prov.count = 1;
          showModalBottomSheet(
            context: context,
            builder: (ctx) => BookingRoom(
              rooms: hotels,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            isScrollControlled: true,
          );
        },
        child: Card(
          elevation: 5,
          color: mainColor,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: const Center(
                child: MainTitle(
              text: 'Book Now',
              fontSize: 20,
              align: TextAlign.center,
              weight: FontWeight.w700,
            )),
          ),
        ),
      ),
    );
  }
}
