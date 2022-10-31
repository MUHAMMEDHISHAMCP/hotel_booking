import 'package:flutter/material.dart';
import 'package:hotel_book/app/utils/colors.dart';

import '../../widgets/maintitle.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: kBlack,
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
          title: const MainTitle(
            text: 'My Favorites',
            fontSize: 22,
            color: kBlack,
            weight: FontWeight.w500,
          ),),
      backgroundColor: backgroundColor,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.grey.shade200,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: ListTile(
                leading: SizedBox(
                  child: Image.asset('assets/homestay.png'),
                ),
                title: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Surappanahalli Homestay',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    MainTitle(
                      text: 'Chikmangalur',
                      weight: FontWeight.w300,
                      fontSize: 14,
                    ),
                    MainTitle(
                      text: 'Book Now',
                      fontSize: 16,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.red.shade300,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
