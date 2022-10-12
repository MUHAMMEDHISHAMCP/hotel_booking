import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_book/app/utils/colors.dart';

class  SearchField extends StatelessWidget {
  const SearchField ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 45,
      child: CupertinoSearchTextField(
                backgroundColor: Colors.grey.shade200,
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: kBlack,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color:kBlack),
                onChanged: (value) {
                
                  // BlocProvider.of<SearchBloc>(context)
                  //     .add(searchMovies(movieQuery: value));
                },
              ),
    );
  }
}