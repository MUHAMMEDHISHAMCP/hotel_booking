import 'package:flutter/material.dart';
import 'package:hotel_book/app/account/view/widgets/account_setting.dart';
import 'package:hotel_book/app/login/controller/login.dart';
import 'package:hotel_book/app/login/view/loginpage.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              // color: mainColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        MainTitle(
                          text: 'User Name',
                          fontSize: 16,
                          weight: FontWeight.bold,
                        ),
                        MainTitle(
                          text: 'E-mail id',
                          fontSize: 14,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),
                    const Icon(Icons.edit)
                  ],
                ),
              ),
            ),
             kheight10,
            // AccountSettings(
            //   icon: const Icon(Icons.location_on_sharp),
            //   title: 'Saved address',
            //   onTap: () {},
            // ),

            AccountSettings(
              icon: const Icon(Icons.notifications),
              title: 'Notification',
              onTap: () {},
            ),

            AccountSettings(
              icon: const Icon(Icons.card_giftcard_sharp),
              title: 'My Bookings',
              onTap: () {},
            ),
            // const ListTile(
            //   leading: Icon(Icons.card_giftcard_sharp),
            //   title: Text(
            //     'My Orders',
            //     style: TextStyle(fontWeight: FontWeight.w500),
            //   ),
            // ),
            AccountSettings(
              icon: const Icon(Icons.perm_contact_cal_rounded),
              title: 'Contact Us',
              onTap: () {},
            ),

            AccountSettings(
              icon: const Icon(Icons.star),
              title: 'Rate this app',
              onTap: () {},
            ),

            AccountSettings(
                icon: const Icon(Icons.logout),
                title: 'Logout',
                onTap: () {
                  logOut(context);
                }),
          ],
        ),
      ),
    );
  }

  void logOut(context) async {
    final prov = Provider.of<SignInController>(context, listen: false);
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text(
            'Logout !!',
            style: TextStyle(color: Colors.red),
          ),
          content: const Text('Are you sure to want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(color: mainColor),
              ),
            ),
            TextButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.clear();
                prov.emailOrPhneController.clear();
                prov.passwordController.clear();

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (cx) => const LogInScreen()),
                    (route) => false);
              },
              child: const Text('Yes',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
