import 'package:flutter/material.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

class OriginalPhonePage extends StatefulWidget {
  const OriginalPhonePage({super.key});

  @override
  State<OriginalPhonePage> createState() => _OriginalPhonePageState();
}

class _OriginalPhonePageState extends State<OriginalPhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Original',
          style: TextStyle(fontSize: 16),
        ),
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
                padding: EdgeInsets.only(top: 10, bottom: 10),
                height: 70,
                width: double.infinity,
                child: SearchProduct(),
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
          ),
        ),
      ),
    );
  }
}
