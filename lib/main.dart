import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/router/app_routes.dart';

import 'business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import 'business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => NavAppCubit()),
        BlocProvider(create: (BuildContext context) => AddOrderCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MDK',
        theme: ThemeData(
          primaryColor: const Color(0xff155079),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 24,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold),
          ),
        ),
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
