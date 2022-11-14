import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/hotels/controller/hotel_controller.dart';
import 'package:hotel_book/app/hotels/controller/room_available.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BookingRoom extends StatelessWidget {
  BookingRoom({Key? key, required this.rooms}) : super(key: key);
  AllRoomsModel rooms;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HotelController>(context);
     final roomProv = Provider.of<RoomAvailabilityProvider>(context);
    final roomTotal = prov.count * rooms.price!.toInt();
    final total = prov.totalDays * roomTotal;

    return Container(
      color: Colors.grey.shade200,
      height: MediaQuery.of(context).size.height / 2.2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kHeight5,
            const MainTitle(
              text: 'Booking',
              fontSize: 18,
              weight: FontWeight.bold,
            ),
            kheight10,
            kheight10,
            Row(
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
            Consumer<RoomAvailabilityProvider>(
              builder: (context, value, child) => 
              value.isLoading == true ? SizedBox(
                                    height: 200,
                                    child: Lottie.asset(
                                      'assets/loading_lottie.json',
                                    ),
                                  )
                                :  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    // width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 30),
                          backgroundColor: Colors.red),
                      child: const Text('Cancel'),
                    ),
                  ),
                  SizedBox(
                    // width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                       value.roomAvailabilityCheck(
                                context,
                                rooms.id.toString(),
                                prov.startDate!,
                                prov.endDate!,
                                prov.count);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 30),
                          backgroundColor: mainColor),
                      child: const Text('Confirm'),
                    ),
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
