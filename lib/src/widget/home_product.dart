import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shoponline/src/dialog/loading_dialog.dart';
import 'package:shoponline/src/resources/detail_product_page.dart';
import 'package:shoponline/src/resources/new_product_page.dart';
import 'package:shoponline/src/resources/phone_category_page.dart';
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
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 440,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchProduct(),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 200,
                    width: double.infinity,
                    child: Carousel(
                      autoplay: true,
                      showIndicator: false,
                      boxFit: BoxFit.fitHeight,
                      autoplayDuration: Duration(milliseconds: 6000),
                      images: [
                        AssetImage('assets_image/1.jfif'),
                        AssetImage('assets_image/2.jfif'),
                        AssetImage('assets_image/3.jfif'),
                      ],
                    ),
                  ),
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
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => PhoneCategoryPage())),
                            child: CircleAvatar(
                              backgroundColor: Colors.indigoAccent,
                              maxRadius: 38,
                              child: Icon(Icons.phone_android),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => PhoneCategoryPage())),
                            child: CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              maxRadius: 38,
                              child: Icon(Icons.tablet),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => PhoneCategoryPage())),
                            child: CircleAvatar(
                              backgroundColor: Colors.amber,
                              maxRadius: 38,
                              child: Icon(Icons.laptop),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => PhoneCategoryPage())),
                            child: CircleAvatar(
                              backgroundColor: Colors.pinkAccent,
                              maxRadius: 38,
                              child: Icon(Icons.keyboard),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => PhoneCategoryPage())),
                            child: CircleAvatar(
                              backgroundColor: Colors.lightGreenAccent,
                              maxRadius: 38,
                              child: Icon(Icons.headphones),
                            ),
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
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: false,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                    ],
                  );
                },
              ),
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
                            "New Product",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NewProductPage()));
                            },
                            child: Text("See All",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: false,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DetailProduct())),
                        child: Card(
                          child: Container(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
