import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myfashionapp/constants/stringconstants.dart';
import 'package:myfashionapp/screens/cart.dart';
import 'package:myfashionapp/screens/favourites.dart';
import 'package:myfashionapp/screens/login.dart';
import 'package:myfashionapp/screens/categories.dart';
import 'package:myfashionapp/widgets/cardlist.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => ChangeState();
}

class ChangeState extends State<Home> {
  String imgs = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 143, 74, 222),
          title: const Text('E-Fashion'),
          elevation: null,
        ),
        persistentFooterButtons: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: IconButton(
                        onPressed: (){},
                          icon: const Icon(Icons.home_filled))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Categoriespage()),
                            );
                          },
                          icon: const Icon(Icons.category_outlined))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                           /*  Navigator.push(
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
        drawer: Drawer(
            elevation: 16.8,
            child: Column(
              children: [
                const UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 143, 74, 222)),
                  accountName: Text('KAVIYALZINI S'),
                  accountEmail: Text('kaviyalzini2003@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                ListTile(
                  title: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Categoriespage()),
                        );
                      },
                      child: const Text(
                        'Categories',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                  leading: const Icon(
                    Icons.category,
                    color: Colors.teal,
                  ),
                ),
                
                const Divider(
                  height: 0.3,
                  thickness: 0.6,
                ),
                ListTile(
                  title: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Account()),
                      );
                    },
                    child: const Text('Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                  leading: const Icon(
                    Icons.login,
                    color: Colors.blue,
                  ),
                ),
                const Divider(
                  height: 0.3,
                  thickness: 0.6,
                ),
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //-----------------------------------Saerch bar----------------------------------------
              const SafeArea(
                  child: SizedBox(
                child: SearchBar(
                    hintText: 'search', leading: Icon(Icons.search_rounded)),
              )),
              //--------------------------------------------Carousel Slider--------------------------------
               CarouselSlider(
                  items: [
                    Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/slide3.jpg'),
                              fit: BoxFit.contain)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/slide2.jpg'),
                              fit: BoxFit.contain)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/slide1.jpg'),
                              fit: BoxFit.contain)),
                    )
                  ],
                  options: CarouselOptions(
                      height: 280,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 14 / 3,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(microseconds: 800),
                      viewportFraction: 0.8)),
              //---------------------------title-------------------------------------
           
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Products For You',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  )), 
            SingleChildScrollView(
              child:
              SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: MediaQuery.of(context).size.height*0.98,
                  child: CardList(
                      count: StringConstants.cardStrings.length,
                      texts: StringConstants.cardStrings,
                      urls: StringConstants.images,
                      type:StringConstants.western,
                      )),

            ),
             
            ],
          ),
        ));
  }
}
