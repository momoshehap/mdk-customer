import 'package:flutter/material.dart';
import 'package:mdk_customer/presintaion/screens/setting/widgets/componants.dart';

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
          buildsettingcomponant("about", "About MDK"),
          buildsettingcomponant("driver", "MDK Driver"),
          buildsettingcomponant("Statistics", "Statistics"),
          buildsettingcomponant("support", "Support"),
          buildsettingcomponant("logout", "Logout"),
        ],
      ),
    );
  }
}
