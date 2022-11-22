import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/hotels/controller/hotel_controller.dart';
import 'package:hotel_book/app/hotels/controller/room_available.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/utils/navigations.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BookingRoom extends StatelessWidget {
  BookingRoom({Key? key, required this.rooms}) : super(key: key);
  AllRoomsModel rooms;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HotelController>(context);
    final roomProvider = Provider.of<BookingProvider>(context);

    final roomTotal = prov.count * rooms.price!.toInt();
    final total = prov.totalDays * roomTotal;

    return Container(
      color: Colors.grey.shade200,
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: roomProvider.isLoading == true
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 150,
                      child: Lottie.asset(
                        'assets/loading_lottie.json',
                      ),
                    ),
                  ],
                ),
              )
            : ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kHeight5,
                  MainTitle(
                    text: roomProvider.isAvailable == false
                        ? 'Booking'
                        : 'Room Available on This days',
                    fontSize: 18,
                    weight: FontWeight.bold,
                  ),
                  kheight10,
                  kheight10,
                  Visibility(
                    visible: roomProvider.isAvailable == false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            // print(prov.c);
                            prov.bookingDate(context);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                color: mainColor,
                              ),
                              kwidth5,
                              Container(
                                width: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45),
                                ),
                                child: Column(
                                  children: [
                                    const MainTitle(
                                      text: 'From',
                                      fontSize: 14,
                                      weight: FontWeight.bold,
                                    ),
                                    MainTitle(
                                      text: prov.startDate == null
                                          ? '${prov.todayDate.day} - '
                                              '${prov.todayDate.month} - '
                                              '${prov.todayDate.year}'
                                          : '${prov.startDate?.day} - '
                                              '${prov.startDate?.month} - '
                                              '${prov.startDate?.year}',
                                      fontSize: 16,
                                      weight: FontWeight.bold,
                                      color: mainColor,
                                    ),
                                  ],
                                ),
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

                        Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                          ),
                          child: Column(
                            children: [
                              const MainTitle(
                                text: 'To',
                                fontSize: 14,
                                weight: FontWeight.bold,
                              ),
                              MainTitle(
                                text: prov.startDate == null
                                    ? '${prov.tmrwDate.day} - '
                                        '${prov.tmrwDate.month} - '
                                        '${prov.tmrwDate.year}'
                                    : '${prov.endDate?.day} - '
                                        '${prov.endDate?.month} - '
                                        '${prov.endDate?.year}',
                                fontSize: 16,
                                color: mainColor,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  kheight10,
                  const MainTitle(
                    text: 'Payment',
                    fontSize: 16,
                    weight: FontWeight.w400,
                    align: TextAlign.start,
                  ),
                  kheight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainTitle(
                        text: rooms.roomName.toString(),
                        fontSize: 16,
                        align: TextAlign.start,
                        weight: FontWeight.w500,
                      ),
                      MainTitle(
                        text: " ${prov.count} x ${rooms.price.toString()}",
                        fontSize: 14,
                        align: TextAlign.start,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  kHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainTitle(
                        text: 'Days',
                        fontSize: 16,
                        align: TextAlign.start,
                        weight: FontWeight.w500,
                      ),
                      MainTitle(
                        text: '${prov.totalDays} x $roomTotal',
                        fontSize: 14,
                        align: TextAlign.start,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  kHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainTitle(
                        text: 'Total',
                        fontSize: 16,
                        align: TextAlign.start,
                        weight: FontWeight.w500,
                      ),
                      MainTitle(
                        text: "₹ ${total.toString()}",
                        fontSize: 18,
                        align: TextAlign.start,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  kHeight15,
                  Visibility(
                    visible: roomProvider.isAvailable == true,
                    child: const MainTitle(
                      text: 'Confirm Your Payment',
                      fontSize: 20,
                      weight: FontWeight.w400,
                    ),
                  ),
                  kHeight15,
                  Consumer<BookingProvider>(
                    builder: (context, value, child) =>
                        // ? Column(
                        //   children: [
                        //     SizedBox(
                        //         height: 300,
                        //         width: 150,
                        //         child: Lottie.asset(

                        //           'assets/loading_lottie.json',

                        //           height: 30,
                        //           width: 50
                        //         ),
                        //       ),
                        //       MainTitle(text: 'Checking Rooms', fontSize: 20)
                        //   ],
                        // )
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          // width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              value.isAvailable == false
                                  ? Navigator.of(context).pop()
                                  : value.payAtHotel();
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(150, 30),
                                backgroundColor: Colors.red),
                            child: value.isAvailable == false
                                ? const Text('Cancel')
                                : const Text('Pay at Hotel'),
                          ),
                        ),
                        SizedBox(
                          // width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                value.isAvailable == false
                                    ? value.roomAvailabilityCheck(
                                        context,
                                        rooms.id.toString(),
                                        prov.startDate!,
                                        prov.endDate!,
                                        prov.count,
                                        total,
                                      )
                                    : value.onPayNowButton(total);
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(150, 30),
                                  backgroundColor: mainColor),
                              child: value.isAvailable == true
                                  ? const Text('Pay Now')
                                  : const Text('Confirm')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
