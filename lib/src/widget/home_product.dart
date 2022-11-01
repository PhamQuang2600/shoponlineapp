import 'package:flutter/material.dart';
import 'package:shoponline/src/resources/new_achives.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/resources/feature_product_page.dart';
import 'package:shoponline/src/widget/search.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 240,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchProduct(),
                    Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.indigoAccent,
                              maxRadius: 38,
                              child: Icon(Icons.phone_android),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              maxRadius: 38,
                              child: Icon(Icons.tablet),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.amber,
                              maxRadius: 38,
                              child: Icon(Icons.laptop),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.pinkAccent,
                              maxRadius: 38,
                              child: Icon(Icons.keyboard),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.lightGreenAccent,
                              maxRadius: 38,
                              child: Icon(Icons.headphones),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Featured",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FeatureProductPage())),
                              child: Text("See All",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Card(
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 50)),
                          Card(
                              child: FeatureProduct(
                                  'assets_image/2.jfif', 'IPhone 4', 50)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Achives",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NewAchivesPage())),
                              child: Text("See All",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Card(
                                child: FeatureProduct('assets_image/1.jfif',
                                    'Xiaomi Note 10s', 50)),
                            Card(
                                child: FeatureProduct(
                                    'assets_image/2.jfif', 'IPhone 4', 50)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
