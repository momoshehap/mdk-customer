import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/presintaion/screens/add_order/widgets/componants.dart';

import '../../../business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import '../../../business_logic/cubit/navigation_cubit/home_navigation_state.dart';
import '../../../utils/strings.dart';

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
    var w = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Contacts"),
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 70),
                child: Column(
                  children: [
                    buildSearchbar(),
                    buildSelectedContactsCard(),
                    buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                    // buildSelectedContactsCard(),
                  ],
                ),
              ),
            ),
            buildBottomOrderBarForOrderScreen(context),
          ],
        ),
      ),
    );
  }
}
