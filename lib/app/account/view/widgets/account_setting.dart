import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AccountSettings extends StatelessWidget {
   AccountSettings({Key? key,required this.icon,required this.title,required this.onTap}) : super(key: key);
Icon icon;
String title;
Function() onTap;
  @override
  Widget build(BuildContext context) {
    return     ListTile(
              leading: icon,
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
             onTap:onTap , 
            );
  }
}