import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FoodMenu extends StatelessWidget {
  FoodMenu({Key? key, required this.imageList, required this.title})
      : super(key: key);

  String imageList;
  String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RestaurantDetails(),));
      // },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imageList,
              width: MediaQuery.of(context).size.width / 3.5,
              height: 100,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 13,
          )
        ],
      ),
    );
  }
}
