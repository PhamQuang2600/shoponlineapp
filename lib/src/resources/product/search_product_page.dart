import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/product/product_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/src/dialog/loading_dialog.dart';

import '../../../models/products/products.dart';
import '../../widget/feature_product.dart';
import '../../widget/product_detail.dart';

class SearchProductPage extends StatefulWidget {
  String keyword;
  SearchProductPage(this.keyword, {super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  SearchProductBloc? searchProductBloc;
  @override
  void initState() {
    super.initState();
    searchProductBloc = BlocProvider.of<SearchProductBloc>(context);
    searchProductBloc!.add(SearchProductEvent(widget.keyword));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: const Color.fromARGB(206, 221, 82, 2),
      ),
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment.bottomLeft,
              height: 50,
              child: Text(
                "Search ${widget.keyword}",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 4),
              height: MediaQuery.of(context).size.height,
              child: BlocListener<SearchProductBloc, ShopState>(
                listener: (context, state) {
                  if (state is SearchProductLoadingState) {
                  } else if (state is SearchProductErrorState) {
                    Center(
                      child: Text(state.message),
                    );
                  } else {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        LoadingDiaLog.hideDiaLog(context);
                      },
                    );
                  }
                },
                child: BlocBuilder<SearchProductBloc, ShopState>(
                  builder: (context, state) {
                    if (state is SearchProductLoadingState) {}
                    return (state is SearchProductLoadedState)
                        ? listSearchProduct(state.searchProduct)
                        : const Center(
                            child: Text(
                              "Not found products!",
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget listSearchProduct(List<Product> product) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(product.length, (index) {
        return ListTile(
          title: Card(
            margin: const EdgeInsets.only(bottom: 4),
            child: FeatureProduct(
                product[index].id,
                product[index].imageProduct,
                product[index].name,
                product[index].price),
          ),
          onTap: () {
            navigateToArticleDetailPage(
                context, product[index].id, product[index].name);
          },
        );
      }),
    );
  }

  void navigateToArticleDetailPage(
      BuildContext context, int productId, String name) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDetail(
        productId: productId,
        name: name,
      );
    }));
  }
}
