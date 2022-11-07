import 'package:flutter/material.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/home/view/widgets/slider.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';

// ignore: must_be_immutable
class MoreDetails extends StatelessWidget {
  MoreDetails({
    Key? key,
    required this.details,
  }) : super(key: key);
  AllRoomsModel details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const  SliverAppBar(
            iconTheme: IconThemeData(color: kBlack),
            backgroundColor: backgroundColor,
            title:  MainTitle(
              text: 'More Details',
              fontSize: 22,
              color: kBlack,
              weight: FontWeight.w500,
            ),
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              SilderWidget(
                image: details.images!.first[1].url.toString(),
                ratio: 1.6,
                autoPlay: true,
              ),
          
              // List.generate(4, (index) => SilderWidget(image: image) )
          
              kheight10,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTitle(
                      text: details.property!.propertyName ?? 'No name',
                      fontSize: 20,
                      weight: FontWeight.bold,
                      lines: 2,
                      align: TextAlign.start,
                    ),
                    kheight10,
                    MainTitle(
                      text: details.property!.address ??
                          'Address Not Available',
                      fontSize: 20,
                      weight: FontWeight.w400,
                      lines: 2,
                      align: TextAlign.start,
                    ),
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const MainTitle(
                              text: 'Contact No',
                              fontSize: 16,
                              weight: FontWeight.bold,
                            ),
                            MainTitle(
                              text: details.property!.phoneNumber.toString(),
                              fontSize: 18,
                              weight: FontWeight.w400,
                              align: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const MainTitle(
                              text: 'Category',
                              fontSize: 16,
                              weight: FontWeight.bold,
                            ),
                            MainTitle(
                              text: details.category!.category ??
                                  'Not available',
                              fontSize: 18,
                              color: kBlack,
                              weight: FontWeight.w400,
                              align: TextAlign.center,
                              //   lines: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    kheight10,
                    Align(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const MainTitle(
                            text: 'E-mail',
                            fontSize: 16,
                            weight: FontWeight.bold,
                            align: TextAlign.center,
                          ),
                          MainTitle(
                            text: details.property!.email ?? 'No email',
                            fontSize: 20,
                            color: kBlack,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    kHeight15,
                    const MainTitle(
                      text: 'More Details',
                      fontSize: 16,
                      weight: FontWeight.bold,
                    ),
                    kheight10,
                    Text(
                      details.property!.propertyDetails ?? 'No description',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
