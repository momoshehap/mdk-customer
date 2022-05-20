import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/presintaion/screens/add_order/widgets/componants.dart';

import '../../../utils/strings.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
        backgroundColor: const Color(0xff155079),
        toolbarHeight: 81,
        leading: Container(),
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
                    buildNotesCard(),
                    buildNotesCard(),
                    buildNotesCard(),
                    buildNotesCard(),
                    buildNotesCard(),
                    buildNotesCard(),
                    buildNotesCard(),
                    buildNotesCard(),
                    buildNotesCard(),
                  ],
                ),
              ),
            ),
            buildBottomOrderBarForAllScreen(
              context: context,
              pN: 5,
              nextPage: orderPictureScreen,
            ),
          ],
        ),
      ),
    );
  }
}