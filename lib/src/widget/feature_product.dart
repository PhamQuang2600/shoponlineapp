import 'package:flutter/material.dart';

class FeatureProduct extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  const FeatureProduct(this.image, this.name, this.price);

  @override
  State<FeatureProduct> createState() => _FeatureProductState();
}

class _FeatureProductState extends State<FeatureProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 185,
      child: Column(
        children: [
          Container(
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('${widget.image}')),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
            child: Text(
              '${widget.name}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text('\$${widget.price}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey)),
          )
        ],
      ),
    );
  }
}