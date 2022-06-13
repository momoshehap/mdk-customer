import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mdk_customer/router/app_routes.dart';
import 'package:mdk_customer/service/api.dart';
import 'package:mdk_customer/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import 'business_logic/cubit/add_order_cubit/add_order_state.dart';
import 'business_logic/cubit/api_cubit/api_Cubit.dart';
import 'business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'localization/localizatios.dart';

late String initialRoute;
late bool isEn;
bool? langu;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Helper.init();
  SharedPreferences userPrefs = await SharedPreferences.getInstance();
  String? user = userPrefs.getString('userData');
  bool? lang = userPrefs.getBool('isEn');
  langu = lang;
  if (user == null) {
    initialRoute = loginScreen;
  } else {
    initialRoute = appMainScreen;
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => NavAppCubit()),
        BlocProvider(create: (BuildContext context) => AddOrderCubit()..init()),
        BlocProvider(create: (BuildContext context) => ApiAppCubit()..init()),
      ],
      child: BlocConsumer<AddOrderCubit, AddOrderStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AddOrderCubit.get(context);

            return MaterialApp(
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
              locale: cubit.locale,
              initialRoute: initialRoute,
              localizationsDelegates: [
                AppLocale.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale("en", ""),
                Locale("ar", ""),
              ],
              localeResolutionCallback: (currentLang, supportedLang) {
                if (cubit.locale == Locale("en", "")) {
                  return supportedLang.first;
                } else {
                  return supportedLang.last;
                }
              },
            );
          }),
    );
  }
}
