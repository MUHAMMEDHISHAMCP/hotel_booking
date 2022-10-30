// import 'package:flutter/material.dart';
// import 'package:hotel_book/app/restaurant/restaurant_details.dart';

// class HotelLists extends StatelessWidget {
//   const HotelLists({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => RestaurantDetails(),));
//       },
//       child: Column(
//         children: [
//           Image.asset(
//             'assets/kfc.png',
//             width: MediaQuery.of(context).size.width / 3.5,
//             height:100,
//           ),
//           const Text(
//             'KFC',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.start,
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/controller/home_controller.dart';
import 'package:hotel_book/app/hotels/view/hotel_details.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class HotelLists extends StatelessWidget {
  const HotelLists({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final roomList = value.allRooms[index];
            // print(roomList.images?.[0]);
            return SizedBox(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HotelDetails(
                        hotels: roomList,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    // Image.network(
                    //   roomList.images,
                    //   height: MediaQuery.of(context).size.height / 5,
                    // ),
             value.isLoading == true ? const CircularProgressIndicator(strokeWidth: 2,):       Image(
                      image:  NetworkImage(roomList.images?.first[0].url ?? ''),
                    ),
                    kHeight5,
                    MainTitle(
                      text: roomList.roomName ?? 'room',
                      fontSize: 20,
                      color: kBlack,
                      weight: FontWeight.bold,
                    ),

                    MainTitle(
                      text: roomList.property!.street ?? '',
                      fontSize: 15,
                      color: kBlack,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
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
          itemCount: value.allRooms.length,
        );
      },
    );
  }
}
