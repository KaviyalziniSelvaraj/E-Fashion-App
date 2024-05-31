import 'package:flutter/material.dart';

import '../constants/stringconstants.dart';
import '../main.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 143, 74, 222),
        title: const Text(StringConstants.favourites),
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
                        icon: const Icon(Icons.home))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Favourites()),
                          );
                        },
                        icon: const Icon(Icons.favorite))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Favourites()),
                          );
                        },
                        icon: const Icon(Icons.shopping_cart))),
              ],
            )
          ],
        )
      ],
    );
  }
}


