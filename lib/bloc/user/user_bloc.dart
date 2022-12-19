import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/models/system/login_model.dart';

import '../../Data_provider/api.service.dart';
import '../../models/system/register_model.dart';
import '../shop_event.dart';
import '../shop_states.dart';

class AuthenticateBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  AuthenticateBloc({required this.repository}) : super(ShopInitialState()) {
    on<AuthenticateEvent>(
      (event, emit) async {
        emit(AuthenticateLoadingState());
        var models =
            LoginModel(user: event.model.user, password: event.model.password);
        models.toJson();
        final result = await repository.authenticate(models);
        if (result) {
          emit(AuthenticateSuccessfulState());
        } else {
          emit(AuthenticateErrorState());
        }
      },
    );
  }
}

class GetUserBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  GetUserBloc({required this.repository}) : super(ShopInitialState()) {
    on<GetUserEvent>(
      (event, emit) async {
        emit(GetUserLoadingState());
        final result = await repository.getByIdUser();
        if (result != null) {
          emit(GetUserLoadedState(user: result));
        } else {
          emit(GetUserErrorState(message: 'False'));
        }
      },
    );
  }
}

class RegisterBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  RegisterBloc({required this.repository}) : super(ShopInitialState()) {
    on<RegisterEvent>(
      (event, emit) async {
        emit(RegisterLoadingState());
        var registers = RegisterModel(
            user: event.model.user,
            name: event.model.name,
            address: event.model.address,
            email: event.model.email,
            phone: event.model.phone,
            password: event.model.password,
            confirmpassword: event.model.confirmpassword);
        registers.toJson();
        bool regist = await repository.register(registers);
        if (regist) {
          emit(RegisterLoadedState());
        } else {
          emit(RegisterErrorState(message: 'Error'));
        }
      },
    );
  }
}

class LogOutBloc extends Bloc<ShopEvent, ShopState> {
  final ApiServices repository;
  LogOutBloc({required this.repository}) : super(ShopInitialState()) {
    on<LogOutEvent>(
      (event, emit) async {
        emit(LogOutLoadingState());
        final result = await repository.logOut();
        if (result) {
          emit(LogOutSuccessfulState());
        }
      },
    );
  }
}
