import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/models/cart/addtocart.dart';

import '../../Data_provider/api.service.dart';
import '../../models/cart/cart.dart';
import '../shop_event.dart';
import '../shop_states.dart';

class GetAllCartBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  GetAllCartBloc({required this.repository}) : super(ShopInitialState()) {
    on<GetAllCartEvent>(
      (event, emit) async {
        emit(GetAllCartLoadingState());
        try {
          var user = await repository.getByIdUser();
          if (user != null) {
            List<Cart> getAllCarts = await repository.getAllCart();
            if (getAllCarts == null) {
              emit(GetAllCartErrorState(message: "No products in cart!"));
            } else {
              emit(GetAllCartLoadedState(getAllCart: getAllCarts));
            }
          } else {
            emit(GetAllCartErrorState(message: "User not logged in!"));
          }
        } catch (e) {
          emit(GetAllCartErrorState(message: e.toString()));
        }
      },
    );
  }
}

class AddToCartBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  AddToCartBloc({required this.repository}) : super(ShopInitialState()) {
    on<AddtoCartEvent>(
      (event, emit) async {
        emit(AddToCartLoadingState());
        var user = await repository.getByIdUser();
        if (user.uid != null) {
          try {
            var cart = AddToCart(user.uid, event.productId);
            int addToCarts = await repository.addToCart(cart);
            emit(AddToCartLoadedState(cartId: addToCarts));
          } catch (e) {
            emit(AddToCartErrorState(message: e.toString()));
          }
        } else {
          emit(AddToCartErrorState(message: "User not logged in!"));
        }
      },
    );
  }
}

class GetByIdCartBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  GetByIdCartBloc({required this.repository}) : super(ShopInitialState()) {
    on<GetByIdCartEvent>(
      (event, emit) async {
        emit(GetByIdCartCartLoadingState());
        try {
          var getById = await repository.getByIdCart(event.cartId);
          emit(GetByIdCartCartLoadedState(getByIdCart: getById));
        } catch (e) {
          emit(GetAllCartErrorState(message: e.toString()));
        }
      },
    );
  }
}

class DeleteCartBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  DeleteCartBloc({required this.repository}) : super(ShopInitialState()) {
    on<DeleteProductEvent>(
      (event, emit) async {
        emit(DeleteCartLoadingState());
        var user = await repository.getByIdUser();
        if (user.token != null) {
          try {
            int deleteCarts = await repository.deleteCart(event.id);
            emit(DeleteCartLoadedState(deleteCart: deleteCarts));
          } catch (e) {
            emit(DeleteCartErrorState(message: e.toString()));
          }
        } else {
          emit(DeleteCartErrorState(message: "User not logged in!"));
        }
      },
    );
  }
}

class UpdatedCartBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  UpdatedCartBloc({required this.repository}) : super(ShopInitialState()) {
    on<UpdateCartEvent>(
      (event, emit) async {
        emit(UpdatedCartLoadingState());
        var user = await repository.getByIdUser();
        if (user.uid != null) {
          try {
            int updatedCarts =
                await repository.updatedCart(event.productId, event.cartId, event.numberProduct);
            emit(UpdatedCartLoadedState(updatedCart: updatedCarts));
          } catch (e) {
            emit(UpdatedCartErrorState(message: e.toString()));
          }
        } else {
          emit(UpdatedCartErrorState(message: "User not logged in!"));
        }
      },
    );
  }
}
