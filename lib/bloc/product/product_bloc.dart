import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data_provider/api.service.dart';
import '../../models/products/products.dart';
import '../shop_event.dart';
import '../shop_states.dart';

class GetFeaturedProductBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  GetFeaturedProductBloc({required this.repository})
      : super(ShopInitialState()) {
    on<GetFeaturedProductEvent>(
      (event, emit) async {
        emit(GetFeaturedProductLoadingState());
        try {
          List<Product> getFeaturedProducts =
              await repository.getFeaturedProduct(5);
          emit(GetFeaturedProductLoadedState(
              getFeaturedProduct: getFeaturedProducts));
        } catch (e) {
          emit(GetFeaturedProductErrorState(message: e.toString()));
        }
      },
    );
  }
}

class GetLatedProductBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  GetLatedProductBloc({required this.repository}) : super(ShopInitialState()) {
    on<GetLatedProductEvent>(
      (event, emit) async {
        emit(GetLatestedProductLoadingState());
        try {
          List<Product> getLatededProducts =
              await repository.getLatestedProduct(5);
          emit(GetLatestedProductLoadedState(
              getLatestedProduct: getLatededProducts));
        } catch (e) {
          emit(GetLatestedProductErrorState(message: e.toString()));
        }
      },
    );
  }
}

class GetByIdProductBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  GetByIdProductBloc({required this.repository}) : super(ShopInitialState()) {
    on<GetByIdProductEvent>(
      (event, emit) async {
        emit(GetProductIdLoadingState());
        try {
          Product getProductId = await repository.getProductId(event.id);
          emit(GetProductIdLoadedState(getProductId: getProductId));
        } catch (e) {
          emit(GetProductIdErrorState(message: e.toString()));
        }
      },
    );
  }
}

class GetRelatedProductBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  GetRelatedProductBloc({required this.repository})
      : super(ShopInitialState()) {
    on<GetReLatedProductEvent>(
      (event, emit) async {
        emit(GetRelatedProductLoadingState());
        try {
          List<Product> getRelatedProducts =
              await repository.getRelatedProduct(event.id, 5);
          emit(GetRelatedProductLoadedState(
              getRelatedProduct: getRelatedProducts));
        } catch (e) {
          emit(GetRelatedProductErrorState(message: e.toString()));
        }
      },
    );
  }
}

class SearchProductBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  SearchProductBloc({required this.repository}) : super(ShopInitialState()) {
    on<SearchProductEvent>(
      (event, emit) async {
        emit(SearchProductLoadingState());
        if (event.keyword == null) {
          emit(SearchProductErrorState(message: "No keyword in textfield!"));
        } else {
          try {
            List<Product> searchProducts =
                await repository.searchProduct(event.keyword);
            if (searchProducts == null) {
              emit(SearchProductErrorState(message: "No Product!"));
            } else {
              emit(SearchProductLoadedState(searchProduct: searchProducts));
            }
          } catch (e) {
            emit(SearchProductErrorState(message: e.toString()));
          }
        }
      },
    );
  }
}
