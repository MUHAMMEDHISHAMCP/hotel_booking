import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SilderWidget extends StatelessWidget {
  SilderWidget({
    Key? key,
    required this.image,
    this.autoPlay = false,
    this.ratio = 1.5,
  }) : super(key: key);
  String image;
  bool autoPlay;
  double ratio;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: curouselImageList
          .map((item) => SizedBox(
                // width: double.infinity,height: MediaQuery.of(context).size.height/3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(image),
                ),
              ))
          .toList(),
      options: CarouselOptions(
          //  autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
          autoPlay: true,
          //   height: 200,
          //  autoPlayCurve: Curves.,
          enlargeCenterPage: autoPlay,
          aspectRatio: ratio,
          viewportFraction: 1.5),
    );
  }
}

final List<String> curouselImageList = [
  'assets/offerbanner.png',
  // 'https://static.vecteezy.com/system/resources/thumbnails/004/903/181/small/japanese-food-background-banner-vector.jpg',
  // 'https://static.vecteezy.com/system/resources/thumbnails/004/903/181/small/japanese-food-background-banner-vector.jpg'
];
