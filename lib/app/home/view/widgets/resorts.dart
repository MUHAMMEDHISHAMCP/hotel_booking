import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/controller/home_controller.dart';
import 'package:hotel_book/app/hotels/view/hotel_details.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class AllResorts extends StatelessWidget {
  const AllResorts({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Consumer<HomeProvider>(
      builder: (context, value, child) {
        return
         value.allResorts.isEmpty
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
                ): value.isLoading == true
            ?  GridView.builder(
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
           
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final roomList = value.allResorts[index];
                      // print(roomList.images?.[0]);
                      return SizedBox(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HotelDetails(
                                  hotels: roomList,
                                  // index: index,
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
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300),
                                    height: 120,
                                    child: Image(
                                      image: NetworkImage(
                                          roomList.images!.first[0].url ?? ''),
                                    ),
                                  ),

                                  kheight10,
                                  MainTitle(
                                    text: roomList.roomName ??
                                        'Name not Available',
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
                    itemCount: value.allResorts.length,
                  );
      },
    );
  }
}
