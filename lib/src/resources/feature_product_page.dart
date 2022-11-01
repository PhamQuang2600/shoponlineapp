import 'package:flutter/material.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

class FeatureProductPage extends StatefulWidget {
  const FeatureProductPage({super.key});

  @override
  State<FeatureProductPage> createState() => _FeatureProductPageState();
}

class _FeatureProductPageState extends State<FeatureProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feature'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(12, 5, 0, 0),
          child: Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(right: 12, bottom: 5),
                    child: SearchProduct()),
                Row(
                  children: [
                    Card(
                        child: FeatureProduct(
                            'assets_image/1.jfif', 'Xiaomi Note 10s', 50)),
                    Card(
                        child: FeatureProduct(
                            'assets_image/2.jfif', 'IPhone 4', 50)),
                  ],
                ),
                Row(
                  children: [
                    Card(
                        child: FeatureProduct(
                            'assets_image/1.jfif', 'Xiaomi Note 10s', 50)),
                    Card(
                        child: FeatureProduct(
                            'assets_image/2.jfif', 'IPhone 4', 50)),
                  ],
                ),
                Row(
                  children: [
                    Card(
                        child: FeatureProduct(
                            'assets_image/1.jfif', 'Xiaomi Note 10s', 50)),
                    Card(
                        child: FeatureProduct(
                            'assets_image/2.jfif', 'IPhone 4', 50)),
                  ],
                ),
                Row(
                  children: [
                    Card(
                        child: FeatureProduct(
                            'assets_image/1.jfif', 'Xiaomi Note 10s', 50)),
                    Card(
                        child: FeatureProduct(
                            'assets_image/2.jfif', 'IPhone 4', 50)),
                  ],
                ),
              ],
            ),
          ))),
    );
  }
}
