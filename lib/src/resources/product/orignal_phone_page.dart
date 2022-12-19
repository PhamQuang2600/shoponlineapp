import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/product/product_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

import '../../../models/products/products.dart';
import '../../widget/product_detail.dart';

class OriginalPhonePage extends StatefulWidget {
  const OriginalPhonePage({super.key});

  @override
  State<OriginalPhonePage> createState() => _OriginalPhonePageState();
}

class _OriginalPhonePageState extends State<OriginalPhonePage> {
  GetFeaturedProductBloc? getFeaturedProductBloc;
  @override
  void initState() {
    getFeaturedProductBloc = BlocProvider.of<GetFeaturedProductBloc>(context);
    getFeaturedProductBloc!.add(GetFeaturedProductEvent());
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
        padding: const EdgeInsets.all(5),
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: const EdgeInsets.only(
                    right: 12, bottom: 5, left: 10, top: 10),
                child: const SearchProduct()),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: BlocListener<GetFeaturedProductBloc, ShopState>(
                listener: (context, state) {
                  if (state is GetFeaturedProductLoadingState) {
                  } else if (state is GetFeaturedProductErrorState) {
                    Center(
                      child: Text(state.message),
                    );
                  }
                },
                child: BlocBuilder<GetFeaturedProductBloc, ShopState>(
                  builder: (context, state) {
                    if (state is GetAllCartLoadingState) {}
                    return (state is GetFeaturedProductLoadedState)
                        ? builRelatedProductList(state.getFeaturedProduct)
                        : const Center(
                            child: Text("Error"),
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

  Widget builRelatedProductList(List<Product> product) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(product.length, (index) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                navigateToArticleDetailPage(
                    context, product[index].id, product[index].name);
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: FeatureProduct(
                    product[index].id,
                    product[index].imageProduct,
                    product[index].name,
                    product[index].price),
              ),
            ),
          );
        }));
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
