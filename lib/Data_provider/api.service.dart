import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shoponline/models/cart/addtocart.dart';
import 'package:shoponline/models/cart/cart.dart';
import 'package:shoponline/models/products/category.dart';
import 'package:shoponline/models/products/original.dart';
import 'package:shoponline/models/system/login_model.dart';
import 'package:shoponline/models/system/register_model.dart';
import '../models/cart/update_cart.dart';
import '../models/products/products.dart';
import '../models/system/user.dart';

abstract class ApiServices {
  Future<List<Category>> getAllCatgory();
  Future<List<Original>> getAllOriginal();
  Future<User> getByIdUser();
  Future<bool> authenticate(LoginModel model);
  Future<bool> register(RegisterModel model);
  Future<bool> deleteUser(String uid);
  Future<Product> getProductId(int id);
  Future<List<Product>> getFeaturedProduct(int take);
  Future<List<Product>> searchProduct(String keyword);
  Future<List<Product>> getLatestedProduct(int take);
  Future<List<Product>> getRelatedProduct(int productId, int take);
  Future<int> addToCart(AddToCart cart);
  Future<int> deleteCart(int id);
  Future<int> updatedCart(int productId, int cartId, int numberProduct);
  Future<List<Cart>> getAllCart();
  Future<Cart> getByIdCart(int cartId);
  Future<bool> logOut();
}

class ApiServicesImp implements ApiServices {
  final _baseUrl = 'http://10.0.2.2:5000/api';

  FlutterSecureStorage _storage = const FlutterSecureStorage();
  String _token = "";

  FlutterSecureStorage get storage => _storage;
  String get token => _token;

  set storage(FlutterSecureStorage newValue) {
    _storage = newValue;
  }

  set token(String newValue) {
    _token = newValue;
  }

  bool isAuthorized = false;

//category
  @override
  Future<List<Category>> getAllCatgory() async {
    final response = await http.get(Uri.parse('$_baseUrl/categories'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<Category>((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

// original

  @override
  Future<List<Original>> getAllOriginal() async {
    final response = await http.get(Uri.parse('$_baseUrl/originals'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<Original>((json) => Original.fromJson(json)).toList();
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

//user
  @override
  Future<User> getByIdUser() async {
    var jwt = await storage.read(key: 'token');
    if (jwt == null) {
      return null as User;
    } else {
      final response = await http.get(Uri.parse('$_baseUrl/users/$jwt'),
          headers: {HttpHeaders.authorizationHeader: jwt});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return User.fromJson(data);
      } else {
        return null as User;
      }
    }
  }

  @override
  Future<bool> authenticate(LoginModel model) async {
    final response = await http.post(Uri.parse('$_baseUrl/users/authenticate'),
        body: json.encode(model),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      try {
        var jsonobj = response.body;
        storage.write(key: 'token', value: jsonobj);
        _token = jsonobj;
        isAuthorized = true;
        return true;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<bool> logOut() async {
    var jwt = await storage.read(key: 'token');
    final response = await http.get(Uri.parse('$_baseUrl/users/logout/$jwt'),
        headers: {HttpHeaders.authorizationHeader: jwt!});
    if (response.statusCode == 200) {
      token = "";
      storage.delete(key: 'token');
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> register(RegisterModel model) async {
    final response = await http.post(Uri.parse('$_baseUrl/users'),
        body: jsonEncode(model), headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> deleteUser(String uid) async {
    var jwt = await storage.read(key: 'token');
    final response = await http.delete(Uri.parse('$_baseUrl/users/$uid'),
        headers: {HttpHeaders.authorizationHeader: jwt!});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //product
  @override
  Future<Product> getProductId(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return Product.fromJson(parsed);
    } else {
      return null as Product;
    }
  }

  @override
  Future<List<Product>> getFeaturedProduct(int take) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/products/featured/$take'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      return null as List<Product>;
    }
  }

  @override
  Future<List<Product>> searchProduct(String keyword) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/products/search/{keyword}'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      return null as List<Product>;
    }
  }

  @override
  Future<List<Product>> getLatestedProduct(int take) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/products/latested/$take'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      return null as List<Product>;
    }
  }

  @override
  Future<List<Product>> getRelatedProduct(int productId, int take) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/products/same/$productId/$take'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      return null as List<Product>;
    }
  }

  //cart
  @override
  Future<int> addToCart(AddToCart cart) async {
    var jwt = await storage.read(key: 'token');
    final response = await http.post(Uri.parse('$_baseUrl/carts'),
        body: json.encode(cart),
        headers: {HttpHeaders.authorizationHeader: jwt!});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return 0;
    }
  }

  @override
  Future<int> deleteCart(int id) async {
    var jwt = await storage.read(key: 'token');
    final response = await http.delete(Uri.parse('$_baseUrl/carts/$id'),
        headers: {HttpHeaders.authorizationHeader: jwt!});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return 0;
    }
  }

  @override
  Future<int> updatedCart(int productId, int cartId, int numberProduct) async {
    var jwt = await storage.read(key: 'token');
    var user = await getByIdUser();
    if (user == null) {
      return 0;
    } else {
      var cart = new UpdateCart(
          uid: user.uid,
          productId: productId,
          cartId: cartId,
          numberProduct: numberProduct);
      final response = await http.put(Uri.parse('$_baseUrl/carts'),
          body: json.encode(cart),
          headers: {HttpHeaders.authorizationHeader: jwt!});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return 0;
      }
    }
  }

  @override
  Future<List<Cart>> getAllCart() async {
    var jwt = await storage.read(key: 'token');
    User user = await getByIdUser();
    var uid = user.uid;
    final response = await http.get(Uri.parse('$_baseUrl/carts/$uid'),
        headers: {HttpHeaders.authorizationHeader: jwt!});
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      if (parsed == null) {
        return null as List<Cart>;
      } else {
        return parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
      }
    } else {
      return null as List<Cart>;
    }
  }

  @override
  Future<Cart> getByIdCart(int cartId) async {
    var jwt = await storage.read(key: 'token');
    final response = await http.get(Uri.parse('$_baseUrl/carts/$cartId'),
        headers: {HttpHeaders.authorizationHeader: jwt!});
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return Cart.fromJson(parsed);
    } else {
      return null as Cart;
    }
  }
}
