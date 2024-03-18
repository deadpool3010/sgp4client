import 'dart:convert';
import 'dart:ui';
import 'package:amaze/catlist.dart';
import 'package:amaze/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:amaze/contsant.dart';
import 'package:amaze/model.dart';
import 'package:amaze/product.dart';
import 'package:amaze/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const My(),
    );
  }
}

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _MyState();
}

String? dataString;

class _MyState extends State<My> {
  int index = 0;
  var prod;

  @override
  void initState() {
    super.initState();

    loadDataFromfire();
  }

  // Future<void> loadData() async {
  //   String data = await load();
  //   setState(() {
  //     dataString = data;
  //   });
  // }

  Future<void> loadFromfire() async {}

  // Future<String> load() async {
  //   String data = await rootBundle.loadString("assets/prod.json");
  //   setState(() {
  //     prod = jsonDecode(data);
  //     //  print(prod);
  //   });
  //   return data;
  // }'

  @override
  Future<void> loadDataFromfire() async {
    QuerySnapshot prod = await fire.collection('product').get();
    var data = prod.docs;
    print(data);
    List<Map<String, dynamic>> map = [];
    for (var x in data) {
      map.add(x.data() as Map<String, dynamic>);
    }
    setState(() {
      fromFire = map;
    });
  }

  Future<String> loadcat() async {
    String data = await rootBundle.loadString("assets/cat.json");
    setState(() {
      prod = jsonDecode(data);
      print(prod);
    });
    return data;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: l[index],
      bottomNavigationBar: BottomNavBar(
        index: index,
        onTabSelected: (int value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTabSelected;

  const BottomNavBar({
    required this.index,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: index,
      backgroundColor: Colors.purple,
      //showElevation: true,
      itemCornerRadius: 24,
      onItemSelected: onTabSelected,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(fontSize: 15),
          ),
          activeColor: Colors.yellow,
          textAlign: TextAlign.center,
          inactiveColor: Colors.white,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Cart'),
          activeColor: Colors.yellow,
          textAlign: TextAlign.center,
          inactiveColor: Colors.white,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.account_box),
          title: Text(
            'Account',
            style: TextStyle(fontSize: 15),
          ),
          activeColor: Colors.yellow,
          textAlign: TextAlign.center,
          inactiveColor: Colors.white,
        ),
      ],
    );
  }
}

Future<void> getdata() async {}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Column(
          children: [
            const Page(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      child: CatList(),
                    ),
                    widgetSlide(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.values[2],
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'New Arrival',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ]),
                    const SizedBox(
                      height: 15,
                    ),
                    newArrivels(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Top Deals',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    widgetSlide(),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Men-Fashion',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    grid()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildImageWithName(String name, String imageUrl) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: 46,
          width: 46,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          width: 7,
        )
      ],
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: const Color.fromRGBO(44, 205, 199, 1),
              width: MediaQuery.of(context).size.width,
              height: 120,
            ),
            Stack(children: [
              Container(
                color: const Color.fromARGB(255, 153, 247, 245),
                //color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: 36,
              ),
              Container(
                padding: const EdgeInsets.only(left: 8),
                width: MediaQuery.of(context).size.width,
                child: const Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 20,
                          ),
                          Text(
                            'Deliver to Dhairya - Surendranagar 363001',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ]),
              )
            ]),
          ],
        ),
        Row(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, right: 30, left: 20),
            child: Center(
              child: Container(
                height: 50,
                width: 285,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 72),
              child: InkWell(
                child: const Icon(Icons.mic),
                onTap: () {
                  print('object');
                },
              )),
        ]),
      ],
    );
  }
}

Widget buildImageWithName(String name, String imageUrl) {
  return Column(
    children: [
      Image.network(imageUrl),
      Text(name),
    ],
  );
}

int current = 1;
final CarouselController carouselController = CarouselController();

Widget widgetSlide() {
  return StatefulBuilder(
    builder: (context, setState) {
      return InkWell(
        onTap: () {
          print(current);
        },
        child: CarouselSlider(
          items: mapp
              .map((e) => CachedNetworkImage(
                    imageUrl: e['imageurl'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ))
              .toList(),
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
          ),
          carouselController: carouselController,
        ),
      );
    },
  );
}

Widget newArrivels() {
  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        height: 220,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: disc.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              //  width: 150,
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black38)),
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  ' ${disc[index]['id']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                CachedNetworkImage(
                    imageUrl: disc[index]['image'],
                    fit: BoxFit.fill,
                    height: 150
                    // height: 50,
                    ),
              ]),
            );
          },
        ),
      );
    },
  );
}

Widget grid() {
  return SizedBox(
    height: 600,
    width: 600,
    child: GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Color.fromARGB(206, 232, 232, 232),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black38)),
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: men_fashion[index]['image'],
                    height: 125,
                    width: 125,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Future<void> catNavigation(BuildContext context, String type) async {
  List<ProdModel> list = [];
  List<dynamic> p = fromFire;
  List<Map<String, dynamic>> map = [];

  for (var x in p) {
    if (x['maincat'] == '${type}') {
      map.add(x);
    }
  }

  list = map.map((e) => ProdModel.fromMap(e)).toList();
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => ProdList(prodlist: list)));
}
