import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myfashionapp/main.dart';

class Cart extends StatefulWidget {
  final Map<String, String> proinfo;
  final String img;
  const Cart({required this.proinfo, required this.img, super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(top: 50, left: 20),
              height: h * 0.5,
              width: w * 1,
              child: Row(
                children: [
                  Card(
                    child: Image.asset(
                      widget.img,
                      height: h * 0.5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("NAME : ${widget.proinfo['name']!}"),
                        Text("PATTERN : ${widget.proinfo['pattern']!}"),
                        Text("COLOR : ${widget.proinfo['color']!}"),
                        Text("PRICE : ${widget.proinfo['price']!}"),
                        const Text("QUANTITY : 1"),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: controller,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: "enter ur address..",
                    constraints: BoxConstraints(maxWidth: w * 0.6),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                maxLines: 5,
                validator: (value) {
                  if (value != null) {
                    return "Please enter your address";
                  }
                  return null;
                },
              )),
          Container(
            padding: const EdgeInsets.only(top: 10),
            width: w * 0.6,
            height: h * 0.1,
            child: ElevatedButton(
                onPressed: () {
                  if (controller.text == "") {
                    Fluttertoast.showToast(
                      msg: "Invalid Address",
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Order Placed Successfully",
                    );
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => const Home()),
                        (route) => false);
                  }
                },
                child: const Text("Place Order")),
          )
        ],
      ),
    ));
  }
}
