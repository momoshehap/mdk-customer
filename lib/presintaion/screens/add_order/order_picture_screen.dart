// import 'package:cross_file_image/cross_file_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_states.dart';
import 'package:mdk_customer/localization/localizatios.dart';
import 'package:mdk_customer/presintaion/screens/add_order/widgets/picture_picker.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/presintaion/screens/add_order/widgets/componants.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import '../../../business_logic/cubit/navigation_cubit/home_navigation_state.dart';
import '../../../utils/strings.dart';
// import 'widgets/picture_picker.dart';

class OrderPictureScreen extends StatefulWidget {
  const OrderPictureScreen({Key? key}) : super(key: key);

  @override
  State<OrderPictureScreen> createState() => _OrderPictureScreenState();
}

class _OrderPictureScreenState extends State<OrderPictureScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    var apiCubit = ApiAppCubit.get(context);
    var cubit = NavAppCubit.get(context);

    return WillPopScope(
      onWillPop: () async {
        NavAppCubit.get(context).navbarIndex = 0;
        NavAppCubit.get(context).screenIndex = 0;
        Navigator.of(context).pushNamedAndRemoveUntil(
            appMainScreen, (Route<dynamic> route) => false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(getLang(context, "image")),
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
                          pickPictureDialog(context);
                        },
                        child: DottedBorder(
                          color: const Color(0xffB2B1B1),
                          dashPattern: const [8, 4],
                          strokeWidth: 2,
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: SvgPicture.asset(
                              "assets/icons/camera.svg",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                      BlocConsumer<AddOrderCubit, AddOrderStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ConditionalBuilder(
                                condition:
                                    AddOrderCubit.get(context).file != null,
                                builder: (context) => Image.file(
                                  AddOrderCubit.get(context).file!,
                                ),
                                fallback: (context) => Container(),
                              ),
                            );
                          }),
                      SizedBox(
                        width: 190,
                        child: BlocConsumer<NavAppCubit, NavappStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  primary: const Color(0xff155079),
                                  minimumSize: const Size.fromHeight(50)),
                              onPressed: () async {
                                if (AddOrderCubit.get(context).file != null) {
                                  // String fileName = AddOrderCubit.get(context)
                                  //     .file!
                                  //     .path
                                  //     .split('/')
                                  //     .last;

                                  apiCubit.makeOrder(
                                    context,
                                  );
                                  cubit.callSuccesScreen();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      appMainScreen,
                                      (Route<dynamic> route) => false);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    backgroundColor: Color(0xff155079),
                                    content: Text("Please Add Picture"),
                                  ));
                                }
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

                  return buildBottomOrderBarForlastScreen(
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
      ),
    );
  }
}
