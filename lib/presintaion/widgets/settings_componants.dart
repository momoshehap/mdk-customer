import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mdk_customer/business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import 'package:mdk_customer/business_logic/cubit/add_order_cubit/add_order_state.dart';
import 'package:mdk_customer/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:mdk_customer/business_logic/cubit/navigation_cubit/home_navigation_state.dart';
import 'package:mdk_customer/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mdk_customer/localization/localizatios.dart';

Widget buildsettingcomponant(BuildContext context,
    {required imgname, required String title, String? screen}) {
  return BlocBuilder<NavAppCubit, NavappStates>(builder: (context, state) {
    var cubit = NavAppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          if (screen == "about") {
            cubit.callSettingsScreen(activeSubSettingScreen: "about");
          }
          if (screen == "driver") {
            cubit.callSettingsScreen(activeSubSettingScreen: "driver");
          }
          if (screen == "Statistics") {
            cubit.callSettingsScreen(activeSubSettingScreen: "Statistics");
          }
          if (screen == "support") {
            cubit.callSettingsScreen(activeSubSettingScreen: "support");
          }
          if (screen == "changeLanguage") {
            changeLanguage(context);
          }
          if (screen == loginScreen) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                loginScreen, (Route<dynamic> route) => false);
            SharedPreferences userPrefs = await SharedPreferences.getInstance();
            await userPrefs.remove('userData');
            NavAppCubit.get(context).screenIndex = 0;
            NavAppCubit.get(context).navbarIndex = 0;
          }
        },
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(
                  2.0,
                  2.0,
                ), //Offset
                blurRadius: 5.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  "assets/icons/$imgname.svg",
                  color: const Color(0xff004067),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: "SegoeUI",
                  color: Color(0xffB2B1B1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
}

Future changeLanguage(contexxt) {
  return showDialog(
      context: contexxt,
      builder: (context) {
        return BlocBuilder<AddOrderCubit, AddOrderStates>(
          builder: (context, state) {
            var cubit = AddOrderCubit.get(context);
            return AlertDialog(
              content: SizedBox(
                width: double.infinity,
                height: 120,
                child: ConditionalBuilder(
                  condition: true,
                  builder: (context) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          cubit.changeLangu(false);
                          cubit.changeLocale(Locale('ar'));

                          SharedPreferences userPrefs =
                              await SharedPreferences.getInstance();
                          userPrefs.setBool("isEn", false);

                          Navigator.pop(context);
                        },
                        child: Container(
                            width: double.infinity,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: const Color(0xff155079),
                            ),
                            child: Text(
                              getLang(contexxt, "arabic"),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "SegoeUI"),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          cubit.changeLangu(true);
                          cubit.changeLocale(Locale('en'));

                          SharedPreferences userPrefs =
                              await SharedPreferences.getInstance();
                          userPrefs.setBool("isEn", true);

                          Navigator.pop(context);
                        },
                        child: Container(
                            width: double.infinity,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: const Color(0xff155079),
                            ),
                            child: Text(
                              getLang(contexxt, "english"),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "SegoeUI"),
                            )),
                      ),
                    ],
                  ),
                  fallback: (context) => const Center(
                      child: CircularProgressIndicator(
                    color: Color(0xff155079),
                  )),
                ),
              ),
            );
          },
        );
      });
}
