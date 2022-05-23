import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildSearchbar(),
            Expanded(
              child: ConditionalBuilder(
                condition: true,
                builder: (context) => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return buildCustomerCard(context);
                  },
                  itemCount: 10,
                ),
                fallback: (context) => const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xff155079),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
