import 'package:flutter/material.dart';
import 'package:mdk_customer/presintaion/screens/home/widgets/componants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSearchbar(),
              buildCustomerCard(),
              buildCustomerCard(),
              buildCustomerCard(),
              buildCustomerCard(),
              buildCustomerCard(),
            ],
          ),
        ),
      ),
    );
  }
}
