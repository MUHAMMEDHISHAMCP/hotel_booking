import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SilderWidget extends StatelessWidget {
  const SilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: curouselImageList
            .map((item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    // width: double.infinity,height: MediaQuery.of(context).size.height/3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlayCurve: Curves.slowMiddle,
            enlargeCenterPage: false,
            aspectRatio: 2.2,
            viewportFraction: 1));
  }
}

final List<String> curouselImageList = [
  'https://static.vecteezy.com/system/resources/thumbnails/004/903/181/small/japanese-food-background-banner-vector.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/004/903/181/small/japanese-food-background-banner-vector.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/004/903/181/small/japanese-food-background-banner-vector.jpg'
];
