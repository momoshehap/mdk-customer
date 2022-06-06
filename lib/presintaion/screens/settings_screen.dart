import 'package:flutter/material.dart';
import 'package:mdk_customer/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:mdk_customer/localization/localizatios.dart';
import 'package:mdk_customer/presintaion/widgets/settings_componants.dart';
import 'package:mdk_customer/utils/strings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({key});

  @override
  State<SettingScreen> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavAppCubit.get(context).navbarIndex = 0;
        NavAppCubit.get(context).screenIndex = 0;
        Navigator.of(context).pushNamedAndRemoveUntil(
            appMainScreen, (Route<dynamic> route) => false);
        return true;
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            buildsettingcomponant(
              context,
              imgname: "about",
              title: getLang(context, "AboutMDK"),
              screen: "about",
            ),
            buildsettingcomponant(
              context,
              imgname: "driver",
              title: getLang(context, "MDKDriver"),
              screen: "driver",
            ),
            buildsettingcomponant(
              context,
              imgname: "Statistics",
              title: getLang(context, "Statistics"),
              screen: "Statistics",
            ),
            buildsettingcomponant(
              context,
              imgname: "support",
              title: getLang(context, "Support"),
              screen: "support",
            ),
            buildsettingcomponant(
              context,
              imgname: "changeLanguage",
              title: getLang(context, "change_language"),
              screen: "changeLanguage",
            ),
            buildsettingcomponant(
              context,
              imgname: "logout",
              title: getLang(context, "logout"),
              screen: loginScreen,
            ),
          ],
        ),
      ),
    );
  }
}
