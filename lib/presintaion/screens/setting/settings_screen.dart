import 'package:flutter/material.dart';
import 'package:mdk_customer/presintaion/screens/setting/widgets/componants.dart';
import 'package:mdk_customer/utils/strings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({key});

  @override
  State<SettingScreen> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          buildsettingcomponant(
            context,
            imgname: "about",
            title: "About MDK",
          ),
          buildsettingcomponant(
            context,
            imgname: "driver",
            title: "MDK Driver",
          ),
          buildsettingcomponant(
            context,
            imgname: "Statistics",
            title: "Statistics",
          ),
          buildsettingcomponant(
            context,
            imgname: "support",
            title: "Support",
          ),
          buildsettingcomponant(context,
              imgname: "logout", title: "Logout", screen: loginScreen),
        ],
      ),
    );
  }
}
