import 'package:flutter/material.dart';
import 'package:hotel_book/app/utils/colors.dart';

class ChoiceChipWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final bool selected;
  final Function(bool) onClick;

  const ChoiceChipWidget({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.onClick,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChoiceChip(
      backgroundColor: Colors.grey.shade300,
      label: SizedBox(
        width: size.width / 5,
        height: size.height / 25,
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
      selectedColor: mainColor,
      onSelected: onClick,
      selected: selected,
    );
  }
}