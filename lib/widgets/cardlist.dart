import 'package:flutter/material.dart';
import 'package:myfashionapp/constants/stringconstants.dart';
import 'package:myfashionapp/screens/product.dart';

class CardList extends StatelessWidget {
  final Color? color;
  final int count;
  final List<String> texts;
  final List<String> urls;
  final List<Map<String,String>> type;
  const CardList({
    super.key,
    this.color,
    required this.count,
    required this.texts,
    required this.urls,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: count,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 80,
          width: 80,
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => Product(
                        image:StringConstants.baseurl + urls[index], type: type[index]))),
            child: Card(
              color: color ?? const Color.fromARGB(255, 255, 255, 255),
              elevation: 10.0,
              child: Image.asset(StringConstants.baseurl + urls[index],fit: BoxFit.fitWidth,),
            ),
          ),
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
