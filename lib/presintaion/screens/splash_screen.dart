import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import '../../utils/strings.dart';
import 'appMain_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    setState(() {
      Timer(const Duration(seconds: 4), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            loginScreen, (Route<dynamic> route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: GradientColors.cloudyKnoxville)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/icons/logoDark.png"),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
