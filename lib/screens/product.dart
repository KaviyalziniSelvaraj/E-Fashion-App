import 'package:flutter/material.dart';
import 'package:myfashionapp/screens/cart.dart';

class Product extends StatefulWidget {
  final String image;
  final Map<String, String> type;

  const Product({
    Key? key,
    required this.image,
    required this.type,
  }) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(image:DecorationImage(image:AssetImage(widget.image),fit: BoxFit.cover)),
                    alignment: Alignment.topCenter,
                    height:  MediaQuery.of(context).size.height*0.6,
                    width:  MediaQuery.of(context).size.width*0.8,
                  ),
                   Card(
                margin: const EdgeInsets.all(30),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Name: "),
                          Text(widget.type['name']!)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Color :"),
                          Text(widget.type['color']!)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Fabric :"),
                          Text(widget.type['fabric']!)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Sleeve :"),
                          Text(widget.type['sleeve']!)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Pattern :"),
                          Text(widget.type['pattern']!)
                        ],
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Price :"),
                          Text(widget.type['price']!)
                        ],
                      ),
                    
                    ],
                  ),
                ),
              ),
                ],
              ),
            ),
            
            Positioned(
              height: 70,
              width: 120,
              left: MediaQuery.of(context).size.width*0.6,
              top: MediaQuery.of(context).size.height*0.7,
              child: SizedBox(
                height: 70,
                width: 70,
                 child: FloatingActionButton.extended(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  Cart(proinfo:widget.type,img:widget.image)));
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('BUY NOW'),
                  ), 
                
              )
              )
          ],
        ),
      );
  }
}
