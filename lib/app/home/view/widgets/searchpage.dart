import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hotel_book/app/home/controller/search_controller.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SearchProvider>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<SearchProvider>(
                    builder: (context, value, child) => LimitedBox(
                      maxHeight: MediaQuery.of(context).size.height / 3,
                      child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final list = value.searchResult[index];
                                return  value.searchResult.isEmpty
                          ? const Center(
                              child: MainTitle(
                                text: 'No results',
                                fontSize: 25,
                                color: kBlack,
                                weight: FontWeight.bold,
                              ),
                            )
                          : SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),

                                    elevation: 3,
                                    // color: mainColor,
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        kHeight5,
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4.5,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: subColor,
                                              image: DecorationImage(
                                                  image: NetworkImage(list
                                                              .images!
                                                              .first[1]
                                                              .url ??
                                                          ''
                                                      // "https://res.cloudinary.com/dzbo5pjhd/image/upload/v1666685014/hotelbooking/Sharafudheen/Delux%20super/bcscqvfwkgc7dtaawc3a.jpg"),
                                                      ),
                                                  fit: BoxFit.fill),
                                            ),
                                            // child: Image(
                                            //   image: AssetImage("assets/offerbanner.png"),
                                            //   height: MediaQuery.of(context).size.height/6,
                                            //   width: double.infinity,
                                            // ),
                                          ),
                                        ),
                                        MainTitle(
                                          text: list.property!.propertyName
                                              .toString(),
                                          fontSize: 20,
                                          weight: FontWeight.bold,
                                        ),
                                        MainTitle(
                                          text:
                                              list.property!.street.toString(),
                                          fontSize: 15,
                                          weight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => kheight10,
                              itemCount: value.searchResult.length,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
