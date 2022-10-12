import 'package:flutter/material.dart';

class GoogleSign extends StatelessWidget {
  const GoogleSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            height: 30,
            width: 170,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(120)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/google.png'),
                ),
                const Text(
                  'Sign In with google',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
