import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({key});

  @override
  State<SettingScreen> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  Widget buildsettingcomponant(String imgname, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          boxShadow: const [
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
            ImageIcon(
              AssetImage("assets/icons/${imgname}.png"),
              color: Color(0xff004067),
              size: 60,
            ),
            Text(
              "${title}",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "SegoeUI",
                color: Color(0xffB2B1B1),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
