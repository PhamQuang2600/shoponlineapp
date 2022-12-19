import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/Data_provider/api.service.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/models/products/category.dart';

class CategoryBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  CategoryBloc({required this.repository}) : super(CategoryLoadingState()) {
    on<ShopEvent>(
      (event, emit) async {
        emit(CategoryLoadingState());
        try {
          List<Category> category = await repository.getAllCatgory();
          emit(CategoryLoadedState(categories: category));
        } catch (e) {
          emit(CategoryErrorState(message: e.toString()));
        }
      },
    );
  }
}
