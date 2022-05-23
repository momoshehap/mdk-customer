import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:mdk_customer/presintaion/screens/add_order/widgets/componants.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contacts"),
        centerTitle: true,
        backgroundColor: const Color(0xff155079),
        toolbarHeight: 81,
      ),
      body: SizedBox(
        height: h,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 70),
              child: Column(
                children: [
                  buildSearchbar(),
                  Expanded(
                    child: ConditionalBuilder(
                      condition: true,
                      builder: (context) => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return buildSelectedContactsCard();
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
            buildBottomOrderBarForOrderScreen(context),
          ],
        ),
      ),
    );
  }
}
