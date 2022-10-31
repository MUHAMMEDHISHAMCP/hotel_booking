import 'package:flutter/material.dart';
import 'package:hotel_book/app/cart/view/widgets/order.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/widgets/maintitle.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back,color: kBlack,),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const MainTitle(text: 'My Cart', fontSize: 22,color:kBlack,weight: FontWeight.w500,)
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.grey.shade200,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                  child: ListTile(
                    leading: SizedBox(
                      child: Image.asset('assets/biriyani.png'),
                    ),
                    title: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Mutton Biriyani',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        MainTitle(
                          text: '3 items | Rahmath hotel',
                          weight: FontWeight.w300,
                          fontSize: 14,
                        ),
                        MainTitle(
                          text: '₹ 499',
                          fontSize: 16,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        color: kBlack,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            itemCount: 10,
          ),
     //     const TotalWidget(),
        ],
      ),
      floatingActionButton: SizedBox(
        child: ElevatedButton(onPressed: (){}, child: Text('cc')),
      ),
    );
  }
}
