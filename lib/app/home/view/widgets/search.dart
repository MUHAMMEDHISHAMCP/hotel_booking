import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/controller/search_controller.dart';
import 'package:hotel_book/app/home/view/homescreen.dart';
import 'package:hotel_book/app/home/view/widgets/searchPage.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, value, child) {
      return Column(
        children: [
          CupertinoSearchTextField(
            autofocus: true,
            controller: value.searchController,
            backgroundColor: Colors.grey.shade200,
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: kBlack,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(color: kBlack),
            onChanged: (val) {
           value.search(context);
            },
          ),
        ],
      );
    });
  }
}
