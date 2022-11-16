import 'package:flutter/material.dart';
import 'package:shoponline/src/resources/orignal_phone_page.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

class PhoneCategoryPage extends StatefulWidget {
  const PhoneCategoryPage({super.key});

  @override
  State<PhoneCategoryPage> createState() => _PhoneCategoryPageState();
}

class _PhoneCategoryPageState extends State<PhoneCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 70,
              padding: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: SearchProduct(),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Featured Product',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.bottomLeft,
              child: Text(
                'New Product',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: Container(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                    ],
                  );
                },
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 8),
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => OriginalPhonePage())),
                          child: Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              margin: EdgeInsets.only(left: 5),
                              color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'SamSung',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => OriginalPhonePage())),
                          child: Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              margin: EdgeInsets.only(left: 5),
                              color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Apple',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => OriginalPhonePage())),
                          child: Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              margin: EdgeInsets.only(left: 5),
                              color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Xiaomi',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => OriginalPhonePage())),
                          child: Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              margin: EdgeInsets.only(left: 5),
                              color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Vivo',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => OriginalPhonePage())),
                          child: Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              margin: EdgeInsets.only(left: 5),
                              color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Mobiistar',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ]),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  height: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => OriginalPhonePage())),
                        child: Container(
                            height: 40,
                            color: Colors.amber,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            margin: EdgeInsets.only(left: 5),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Oppo',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => OriginalPhonePage())),
                        child: Container(
                            height: 40,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            margin: EdgeInsets.only(left: 5),
                            color: Colors.amber,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'VinSmart',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
