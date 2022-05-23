// import 'package:cross_file_image/cross_file_image.dart';

import 'package:flutter/material.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/presintaion/screens/add_order/widgets/componants.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import '../../../business_logic/cubit/navigation_cubit/home_navigation_state.dart';
import '../../../utils/strings.dart';
// import 'widgets/picture_picker.dart';

class OrderPictureScreen extends StatelessWidget {
  const OrderPictureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Picture"),
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
                    InkWell(
                      onTap: () {
                        // pickPictureDialog(context);
                      },
                      child: DottedBorder(
                        color: const Color(0xffB2B1B1),
                        dashPattern: const [8, 4],
                        strokeWidth: 2,
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset(
                            "assets/icons/camera.png",
                          ),
                        ),
                      ),
                    ),
                    BlocConsumer<AddOrderCubit, AddOrderStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/icons/order.jpg",
                            // child: AddOrderCubit.get(context).imageFile == null
                            //     ? Image.asset(
                            //         "assets/icons/order.jpg",
                            //       )
                            //     : Image(
                            //         image: FileImage(
                            //         AddOrderCubit.get(context).imageFile,
                            //       ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 190,
                      child: BlocConsumer<NavAppCubit, NavappStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          var cubit = NavAppCubit.get(context);

                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                primary: const Color(0xff155079),
                                minimumSize: const Size.fromHeight(50)),
                            onPressed: () {
                              cubit.callSuccesScreen();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  appMainScreen,
                                  (Route<dynamic> route) => false);
                            },
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "SegoeUI",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<NavAppCubit, NavappStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = NavAppCubit.get(context);

                return buildBottomOrderBarForAllScreen(
                  context: context,
                  pN: 6,
                  getBack: false,
                  nextPage: appMainScreen,
                  changeState: () {
                    cubit.callSuccesScreen();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
