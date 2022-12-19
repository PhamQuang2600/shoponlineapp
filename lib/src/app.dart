import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/cart/cart_bloc.dart';
import 'package:shoponline/src/resources/home.dart';

import '../Data_provider/api.service.dart';
import '../bloc/product/product_bloc.dart';
import '../bloc/user/user_bloc.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              AuthenticateBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              LogOutBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RegisterBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              GetUserBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              GetFeaturedProductBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              GetByIdProductBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              GetLatedProductBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              GetRelatedProductBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              GetAllCartBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              DeleteCartBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              UpdatedCartBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              AddToCartBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              GetByIdCartBloc(repository: ApiServicesImp()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              SearchProductBloc(repository: ApiServicesImp()),
        ),
      ],
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: Home()),
    );
  }
}
