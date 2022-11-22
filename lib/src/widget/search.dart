import 'package:flutter/material.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Search',
            suffixIcon: const Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
