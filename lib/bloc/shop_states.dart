import 'package:equatable/equatable.dart';
import '../models/cart/cart.dart';
import '../models/products/category.dart';
import '../models/products/original.dart';
import '../models/products/products.dart';
import '../models/system/user.dart';

abstract class ShopState extends Equatable {}

class ShopInitialState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

//category
class CategoryLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CategoryLoadedState extends ShopState {
  List<Category> categories;
  CategoryLoadedState({required this.categories});

  @override
  List<Object> get props => throw UnimplementedError();
}

class CategoryErrorState extends ShopState {
  String message;
  CategoryErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//original
class OriginalLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class OriginalLoadedState extends ShopState {
  List<Original> originals;
  OriginalLoadedState({required this.originals});

  @override
  List<Object> get props => throw UnimplementedError();
}

class OriginalErrorState extends ShopState {
  String message;
  OriginalErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//authenticate
class AuthenticateLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AuthenticateSuccessfulState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AuthenticateErrorState extends ShopState {
  String? message;
  AuthenticateErrorState({this.message});
  @override
  List<Object?> get props => [message];
}

//logout
class LogOutLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LogOutSuccessfulState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

//register
class RegisterLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class RegisterLoadedState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class RegisterErrorState extends ShopState {
  String message;
  RegisterErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//getuser
class GetUserLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetUserLoadedState extends ShopState {
  User user;
  GetUserLoadedState({required this.user});
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetUserErrorState extends ShopState {
  String message;
  GetUserErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//GetProductId
class GetProductIdLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetProductIdLoadedState extends ShopState {
  Product getProductId;
  GetProductIdLoadedState({required this.getProductId});

  @override
  List<Object> get props => throw UnimplementedError();
}

class GetProductIdErrorState extends ShopState {
  String message;
  GetProductIdErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//GetFeaturedProduct
class GetFeaturedProductLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetFeaturedProductLoadedState extends ShopState {
  List<Product> getFeaturedProduct;
  GetFeaturedProductLoadedState({required this.getFeaturedProduct});

  @override
  List<Object> get props => throw UnimplementedError();
}

class GetFeaturedProductErrorState extends ShopState {
  String message;
  GetFeaturedProductErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//GetLatestedProduct
class GetLatestedProductLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetLatestedProductLoadedState extends ShopState {
  List<Product> getLatestedProduct;
  GetLatestedProductLoadedState({required this.getLatestedProduct});

  @override
  List<Object> get props => throw UnimplementedError();
}

class GetLatestedProductErrorState extends ShopState {
  String message;
  GetLatestedProductErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//GetRelatedProduct
class GetRelatedProductLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetRelatedProductLoadedState extends ShopState {
  List<Product> getRelatedProduct;
  GetRelatedProductLoadedState({required this.getRelatedProduct});

  @override
  List<Object> get props => throw UnimplementedError();
}

class GetRelatedProductErrorState extends ShopState {
  String message;
  GetRelatedProductErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//GetRelatedProduct
class SearchProductLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class SearchProductLoadedState extends ShopState {
  List<Product> searchProduct;
  SearchProductLoadedState({required this.searchProduct});

  @override
  List<Object> get props => throw UnimplementedError();
}

class SearchProductErrorState extends ShopState {
  String message;
  SearchProductErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//AddToCart
class AddToCartLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AddToCartLoadedState extends ShopState {
  int cartId;
  AddToCartLoadedState({required this.cartId});

  @override
  List<Object> get props => throw UnimplementedError();
}

class AddToCartErrorState extends ShopState {
  String message;
  AddToCartErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//DeleteCart
class DeleteCartLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class DeleteCartLoadedState extends ShopState {
  int deleteCart;
  DeleteCartLoadedState({required this.deleteCart});

  @override
  List<Object> get props => throw UnimplementedError();
}

class DeleteCartErrorState extends ShopState {
  String message;
  DeleteCartErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//UpdatedCart
class UpdatedCartLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class UpdatedCartLoadedState extends ShopState {
  int updatedCart;
  UpdatedCartLoadedState({required this.updatedCart});

  @override
  List<Object> get props => throw UnimplementedError();
}

class UpdatedCartErrorState extends ShopState {
  String message;
  UpdatedCartErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//GetAllCart
class GetAllCartLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetAllCartLoadedState extends ShopState {
  List<Cart> getAllCart;
  GetAllCartLoadedState({required this.getAllCart});

  @override
  List<Object> get props => throw UnimplementedError();
}

class GetAllCartErrorState extends ShopState {
  String message;
  GetAllCartErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}

//GetByIdCart
class GetByIdCartCartLoadingState extends ShopState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetByIdCartCartLoadedState extends ShopState {
  Cart getByIdCart;
  GetByIdCartCartLoadedState({required this.getByIdCart});

  @override
  List<Object> get props => throw UnimplementedError();
}

class GetByIdCartCartErrorState extends ShopState {
  String message;
  GetByIdCartCartErrorState({required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}
