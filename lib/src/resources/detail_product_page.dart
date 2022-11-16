import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shoponline/src/widget/product_detail.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetail(),
    );
  }
}
