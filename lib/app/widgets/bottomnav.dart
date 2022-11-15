import 'package:flutter/material.dart';
import 'package:hotel_book/app/account/view/account_page.dart';
import 'package:hotel_book/app/favourite/view/favourite_page.dart';
import 'package:hotel_book/app/home/view/homescreen.dart';
import 'package:hotel_book/app/utils/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNav> {
  int selectedIndex = 0;

  final screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: iconColor,
          unselectedItemColor: unselectedItemColor,
          backgroundColor: subColor,
          iconSize: 30,
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          items: [
            const BottomNavigationBarItem(
              backgroundColor: subColor,
              icon: Icon(Icons.home),
              label: 'Home',
            ),
        
            BottomNavigationBarItem(
              backgroundColor: subColor,
              icon: selectedIndex == 1
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              label: 'WishList',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
            )
          ]),
    );
  }
}
