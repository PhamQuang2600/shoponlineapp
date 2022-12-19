import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/product/product_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

import '../../../models/products/products.dart';
import '../../widget/product_detail.dart';

class NewProductPage extends StatefulWidget {
  NewProductPage({super.key});

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  GetLatedProductBloc? getLated;
  @override
  void initState() {
    super.initState();
    getLated = BlocProvider.of<GetLatedProductBloc>(context);
    getLated!.add(GetLatedProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Products'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SizedBox(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(
                    right: 12, bottom: 5, left: 10, top: 10),
                child: const SearchProduct()),
            SizedBox(
              height: MediaQuery.of(context).size.height - 160,
              child: BlocListener<GetLatedProductBloc, ShopState>(
                listener: (context, state) {
                  if (state is GetLatestedProductLoadingState) {
                    //LoadingDiaLog.showLoadingDiaLog(context, 'Loading');
                  } else if (state is GetLatestedProductErrorState) {
                    Center(
                      child: Text(state.message),
                    );
                  }
                },
                child: BlocBuilder<GetLatedProductBloc, ShopState>(
                  builder: (context, state) {
                    if (state is GetLatestedProductLoadingState) {
                      // LoadingDiaLog.showLoadingDiaLog(context, 'Loading');
                    }
                    return (state is GetLatestedProductLoadedState)
                        ? builRelatedProductList(state.getLatestedProduct)
                        : const Center(
                            child: Text('Wait, loading products!'),
                          );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget builRelatedProductList(List<Product> product) {
    return GridView.count(
      childAspectRatio: 1,
      crossAxisCount: 2,
      children: List.generate(product.length, (index) {
        return GridTile(
          child: Card(
            child: GestureDetector(
              onTap: () {
                navigateToArticleDetailPage(
                    context, product[index].id, product[index].name);
              },
              child: FeatureProduct(
                  product[index].id,
                  product[index].imageProduct,
                  product[index].name,
                  product[index].price),
            ),
          ),
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
