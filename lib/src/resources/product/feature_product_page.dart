import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/product/product_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/src/resources/home.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

import '../../../bloc/shop_states.dart';
import '../../../models/products/products.dart';
import '../../widget/product_detail.dart';

class FeatureProductPage extends StatefulWidget {
  const FeatureProductPage({super.key});

  @override
  State<FeatureProductPage> createState() => _FeatureProductPageState();
}

class _FeatureProductPageState extends State<FeatureProductPage> {
  GetFeaturedProductBloc? getFeatureProduct;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getFeatureProduct = BlocProvider.of<GetFeaturedProductBloc>(context);
      getFeatureProduct!.add(GetFeaturedProductEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  }, child: BlocBuilder<GetFeaturedProductBloc, ShopState>(
                          builder: (context, state) {
                    if (state is GetFeaturedProductLoadingState) {}
                    return (state is GetFeaturedProductLoadedState)
                        ? builProductList(state.getFeaturedProduct)
                        : const Center(
                            child: Text("Wait, loading products!"),
                          );
                  })),
                )
              ],
            ),
          )),
    );
  }

  Widget builProductList(List<Product> product) {
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
