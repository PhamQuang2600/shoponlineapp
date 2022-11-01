import 'package:flutter/material.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

class NewAchivesPage extends StatefulWidget {
  const NewAchivesPage({super.key});

  @override
  State<NewAchivesPage> createState() => _NewAchivesPageState();
}

class _NewAchivesPageState extends State<NewAchivesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Achives'),
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
