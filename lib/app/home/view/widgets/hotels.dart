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
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';

class HotelLists extends StatelessWidget {
  const HotelLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Column(
            children: [
              Image.asset('assets/hotelroom.png',height: MediaQuery.of(context).size.height/5,),
              MainTitle(
                text: 'Navarathna',
                fontSize: 20,
                color: kBlack,
                weight: FontWeight.bold,
              ),
                        MainTitle(
                text: 'Thalassery',
                fontSize: 15,
                color: kBlack,
                weight: FontWeight.w400,
              ),
            ],
          ),
        );
      },
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.8),
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 3,
      ),
      itemCount: 8,
    );
  }
}
