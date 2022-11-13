import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/controller/home_controller.dart';
import 'package:hotel_book/app/hotels/controller/hotel_controller.dart';
import 'package:hotel_book/app/hotels/view/hotel_details.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class AllHotelLists extends StatelessWidget {
  const AllHotelLists({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return    value.isLoading == true 
            ? GridView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          color: Colors.grey.shade300,
                        ),
                        kHeight5,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 25,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.8),
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: 6,
              )
            :value.allHotels.isEmpty
                ?  SizedBox(
                  height: MediaQuery.of(context).size.height/2,
                  child: const Center(
                    child: MainTitle(
                      text: 'Resorts Not Available',
                      fontSize: 25,
                      color: mainColor,
                      weight: FontWeight.bold,
                    ),
                  ),
                ):
             GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final roomList = value.allHotels[index];
                  // print(roomList.images?.[0]);
                  return SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        context.read<HotelController>().count = 1;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HotelDetails(
                              hotels: roomList,
                            ),
                          ),
                        );
                      },
                      child: Consumer<HomeProvider>(
                          builder: (context, val, child) {
                        return Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          elevation: 3,
                          child: Column(
                            children: [
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(image:  NetworkImage(
                              //           roomList.images?.first[0].url ?? ''),)
                              // ),
                              SizedBox(
                                height: 120,
                                child: CachedNetworkImage(
                                  imageUrl: roomList.images!.first[1].url ?? '',
                                  placeholder: (context, urL) => const Image(
                                    image: AssetImage('assets/placeholder.png'),
                                  ),
                                  errorWidget: (context, urL, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),

                              kheight10,
                              MainTitle(
                                text: roomList.roomName ?? 'Name not Available',
                                fontSize: 20,
                                color: kBlack,
                                weight: FontWeight.bold,
                              ),
                              MainTitle(
                                text: roomList.property!.street ??
                                    'Place not available',
                                fontSize: 15,
                                color: kBlack,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.7),
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 10,
                ),
                itemCount: value.allHotels.length,
              );
      },
    );
  }
}
