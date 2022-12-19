import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/models/products/original.dart';

import '../../Data_provider/api.service.dart';
import '../shop_event.dart';
import '../shop_states.dart';

class OriginalBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  OriginalBloc({required this.repository}) : super(OriginalLoadingState()) {
    on<ShopEvent>(
      (event, emit) async {
        emit(OriginalLoadingState());
        try {
          List<Original> original = await repository.getAllOriginal();
          emit(OriginalLoadedState(originals: original));
        } catch (e) {
          emit(OriginalErrorState(message: e.toString()));
        }
      },
    );
  }
}
