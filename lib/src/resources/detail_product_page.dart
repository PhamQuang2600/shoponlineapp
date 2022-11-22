import 'package:flutter/material.dart';
import 'package:shoponline/src/widget/product_detail.dart';

import '../dialog/loading_dialog.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
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
    return const Scaffold(
      body: ProductDetail(),
    );
  }
}
