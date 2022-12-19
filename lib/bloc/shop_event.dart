import 'package:equatable/equatable.dart';
import 'package:shoponline/models/cart/addtocart.dart';
import 'package:shoponline/models/system/login_model.dart';
import 'package:shoponline/models/system/register_model.dart';

import '../models/cart/cart.dart';
import '../models/cart/update_cart.dart';

abstract class ShopEvent extends Equatable {}

class AuthenticateEvent extends ShopEvent {
  LoginModel model;
  AuthenticateEvent({required this.model});
  @override
  List<Object?> get props => [model];
}

class RegisterEvent extends ShopEvent {
  RegisterModel model;
  RegisterEvent({required this.model});
  @override
  List<Object?> get props => [model];
}

class LogOutEvent extends ShopEvent {
  LogOutEvent();
  @override
  List<Object?> get props => [];
}

class GetUserEvent extends ShopEvent {
  @override
  List<Object?> get props => [];
}

class GetFeaturedProductEvent extends ShopEvent {
  @override
  List<Object?> get props => [];
}

class SearchProductEvent extends ShopEvent {
  String keyword;
  SearchProductEvent(this.keyword);
  @override
  List<Object?> get props => [keyword];
}

class GetLatedProductEvent extends ShopEvent {
  @override
  List<Object?> get props => [];
}

class GetReLatedProductEvent extends ShopEvent {
  int id;
  GetReLatedProductEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class GetByIdProductEvent extends ShopEvent {
  int id;
  GetByIdProductEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class GetAllCartEvent extends ShopEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCartEvent extends ShopEvent {
  int productId;
  int cartId;
  int numberProduct;
  UpdateCartEvent(this.productId, this.cartId, this.numberProduct);
  @override
  List<Object?> get props => [productId, cartId, numberProduct];
}

class DeleteProductEvent extends ShopEvent {
  int id;
  DeleteProductEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class AddtoCartEvent extends ShopEvent {
  int productId;
  AddtoCartEvent(this.productId);
  @override
  List<Object?> get props => [productId];
}

class GetByIdCartEvent extends ShopEvent {
  int cartId;
  GetByIdCartEvent(this.cartId);
  @override
  List<Object?> get props => [cartId];
}
