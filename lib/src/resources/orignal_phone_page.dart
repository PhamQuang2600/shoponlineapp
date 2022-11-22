import 'package:flutter/material.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

import '../dialog/loading_dialog.dart';

class OriginalPhonePage extends StatefulWidget {
  const OriginalPhonePage({super.key});

  @override
  State<OriginalPhonePage> createState() => _OriginalPhonePageState();
}

class _OriginalPhonePageState extends State<OriginalPhonePage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 2),
      () {
        Future.delayed(const Duration(milliseconds: 2), () {
          LoadingDiaLog.showLoadingDiaLog(context, '');
          Future.delayed(const Duration(seconds: 2), () {
            LoadingDiaLog.hideDiaLog(context);
          });
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Original',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                height: 70,
                width: double.infinity,
                child: const SearchProduct(),
              ),
              Row(
                children: const [
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
                children: const [
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
                children: const [
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
                children: const [
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
                children: const [
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
