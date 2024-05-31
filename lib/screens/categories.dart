import 'package:flutter/material.dart';
import 'package:myfashionapp/constants/stringconstants.dart';
import 'package:myfashionapp/screens/cart.dart';
import 'package:myfashionapp/widgets/cardlist.dart';

import '../main.dart';
import 'favourites.dart';

class Categoriespage extends StatelessWidget {
  const Categoriespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 143, 74, 222),
        title: const Text('Categories'),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        },
                        icon: const Icon(Icons.home_outlined))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(Icons.category))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cart()),
                          ); */
                        },
                        icon: const Icon(Icons.shopping_cart_outlined))),
              ],
            )
          ],
        )
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child:
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text("Womens Collections",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*1.0,
                        child: CardList(
                            count: StringConstants.cardStrings.length,
                            texts: StringConstants.cardStrings,
                            urls: StringConstants.sareeimg,
                            type: StringConstants.saree,
                            )),
                    const Text("Kids Collections",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*1.0,
                        child: CardList(
                            count: StringConstants.cardStrings.length,
                            texts: StringConstants.cardStrings,
                            urls: StringConstants.kidimg,
                            type: StringConstants.kids,
                            )),
                  ],
                ),
              ),

            ),
    );
  }
}
