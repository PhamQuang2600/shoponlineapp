import 'package:flutter/material.dart';
import 'package:shoponline/src/dialog/loading_dialog.dart';
import 'package:shoponline/src/resources/product/search_product_page.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  TextEditingController keyword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        controller: keyword,
        onSubmitted: (keyword) {
          Future.delayed(
            Duration.zero,
            () {
              LoadingDiaLog.showLoadingDiaLog(context, "Loading");
            },
          );
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SearchProductPage(keyword)));
            },
          );
        },
        decoration: InputDecoration(
            labelText: 'Search',
            suffixIcon: const Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
