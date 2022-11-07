import 'package:flutter/material.dart';
import 'package:hotel_book/app/utils/colors.dart';

class IconWidgets extends StatelessWidget {
  IconWidgets(
      {Key? key,
      required this.icon,
      this.bottom = 0,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.radius = 20,
      required this.onTap})
      : super(key: key);
  double right;
  double left;
  double top;
  double bottom;
  IconData icon;
  double radius;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: kBlack,
      child: Center(
        child: IconButton(
          onPressed: onTap,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
