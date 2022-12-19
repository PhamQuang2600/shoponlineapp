import 'package:shoponline/models/cart/cart.dart';

class AddToCart {
  String uid;
  int productId;
  AddToCart(this.uid, this.productId);
  Map<String, dynamic> toJson() => {'uid': uid, 'productId': productId};
  factory AddToCart.fromJson(Map<String, dynamic> json) =>
      AddToCart(json['uid'], json['productId']);
}
