import 'package:flutter/material.dart';
import 'package:hotel_book/app/utils/colors.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Icon(
            Icons.place,
            color: kBlack,
            size: 22,
          ),
          SizedBox(width: 2),
          Text(
            '249,  Kakkanchery, Malappurem 670741',
            style: TextStyle(
                color: kBlack,
                fontFamily: 'SubMainFont'),
          ),
        ],
      ),
    );
  }
}