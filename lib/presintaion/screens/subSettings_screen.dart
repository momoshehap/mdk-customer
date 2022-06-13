import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_states.dart';
import 'package:mdk_customer/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:mdk_customer/business_logic/cubit/navigation_cubit/home_navigation_state.dart';
import 'package:mdk_customer/presintaion/widgets/subString_componants.dart';
import 'package:mdk_customer/utils/strings.dart';

class SubSettingsScreen extends StatelessWidget {
  const SubSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiAppCubit.get(context).getMyStatistics();
    ApiAppCubit.get(context).getMyMdkDriver();

    return WillPopScope(
      onWillPop: () async {
        NavAppCubit.get(context).navbarIndex = 4;
        NavAppCubit.get(context).screenIndex = 4;
        Navigator.of(context).pushNamedAndRemoveUntil(
            appMainScreen, (Route<dynamic> route) => false);
        return true;
      },
      child: BlocBuilder<ApiAppCubit, ApiStates>(builder: (context, apistate) {
        var apiCubit = ApiAppCubit.get(context);

        return BlocBuilder<NavAppCubit, NavappStates>(
          builder: (context, state) {
            var navCubit = NavAppCubit.get(context);
            if (navCubit.activeSubSettingScreen == "about") {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Test About us page from admin panel",
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Color(0xff707070),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (navCubit.activeSubSettingScreen == "driver") {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                child: Center(
                  child: ConditionalBuilder(
                    condition: apistate is! NewLoadinMdkDriverState &&
                        apiCubit.ismdkDriver,
                    builder: (context) => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return buildMdkDriverCard(
                            apiCubit.mdkDrivers!.response.data);
                      },
                      itemCount: 1,
                    ),
                    fallback: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xff155079),
                    )),
                  ),
                ),
              );
            }
            if (navCubit.activeSubSettingScreen == "Statistics") {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ConditionalBuilder(
                    condition: apistate is! NewLoadinStatisticsState &&
                        apiCubit.isstatistics,
                    builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Total Number Of Orders",
                            style: TextStyle(
                              fontSize: 19,
                              color: Color(0xffB2B1B1),
                              fontWeight: FontWeight.bold,
                              fontFamily: "SegoeUI",
                            ),
                          ),
                          Text(
                            apiCubit.statistics!,
                            style: const TextStyle(
                              fontSize: 19,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Color(0xff707070),
                            ),
                          ),
                        ],
                      );
                    },
                    fallback: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xff155079),
                    )),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          apiCubit.makingPhoneCall("+4893684823");
                        },
                        child: const Text(
                          "+4893684823",
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff155079),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          apiCubit.makingPhoneCall("+9615411523");
                        },
                        child: const Text(
                          "+9615411523",
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff155079),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          apiCubit.makingPhoneCall("+5212454810");
                        },
                        child: const Text(
                          "+5212454810",
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff155079),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
