import 'package:flutter/material.dart';

class FeatureProduct extends StatelessWidget {
  int productId;
  String image;
  String name;
  double price;
  FeatureProduct(this.productId, this.image, this.name, this.price,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: SizedBox(
        height: 250,
        width: 185,
        child: Column(
          children: [
            Container(
              height: 148,
              width: 160,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets_image/$image')),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text('\$$price',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }
}
