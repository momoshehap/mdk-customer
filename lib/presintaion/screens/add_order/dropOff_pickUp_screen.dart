import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:mdk_customer/localization/localizatios.dart';
import 'package:mdk_customer/presintaion/screens/add_order/widgets/componants.dart';
import '../../../utils/strings.dart';

class DropOffPickUpScreen extends StatelessWidget {
  const DropOffPickUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    var apiCubit = ApiAppCubit.get(context);

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
          title: Text(getLang(context, "dropPick")),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 70),
                child: Column(
                  children: [
                    Expanded(
                      child: ConditionalBuilder(
                        condition: true,
                        builder: (context) => ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return buildDropPickCard(
                                apiCubit.makingorders[index], index);
                          },
                          itemCount: apiCubit.makingorders.length,
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
              buildBottomOrderBarForAllScreen(
                context: context,
                pN: 2,
                nextPage: collectionScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
