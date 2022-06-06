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
late bool first = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Helper.init();
  SharedPreferences userPrefs = await SharedPreferences.getInstance();
  String? user = userPrefs.getString('userData');
  bool? lang = userPrefs.getBool('isEn');

  if (user == null) {
    initialRoute = loginScreen;
  } else {
    initialRoute = appMainScreen;
  }
  if (lang == null) {
    print(lang);
    isEn = true;
  } else {
    print("arabic");
    print(lang);

    isEn = lang;
    print(isEn);
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
          listener: (context, state) {
        if (state is ChangeLanguagestate) {
          setState(() {
            print(state);
          });
        }
      }, builder: (context, state) {
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
          localeResolutionCallback: first
              ? (currentLang, supportedLang) {
                  if (isEn) {
                    print(isEn);
                    first = false;
                    return supportedLang.first;
                  } else {
                    print(isEn);
                    first = false;

                    return supportedLang.last;
                  }
                }
              : cubit.localeResolutionCallback,
        );
      }),
    );
  }
}
