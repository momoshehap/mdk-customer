import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_states.dart';
import 'package:mdk_customer/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:mdk_customer/localization/localizatios.dart';
import 'package:mdk_customer/presintaion/screens/add_order/widgets/componants.dart';
import 'package:mdk_customer/utils/strings.dart';

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
    ApiAppCubit.get(context).getContacts();
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
          title: Text(getLang(context, "SelectContacts")),
          centerTitle: true,
          backgroundColor: const Color(0xff155079),
          toolbarHeight: 81,
        ),
        body: BlocBuilder<ApiAppCubit, ApiStates>(builder: (context, state) {
          var apiCubit = ApiAppCubit.get(context);
          return SizedBox(
            height: h,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 70),
                  child: Column(
                    children: [
                      buildSearchbar(context),
                      Expanded(
                        child: ConditionalBuilder(
                          condition: state is! NewLoadingCustomersDataState &&
                              state is! NewLoadingShearchCustomersDataState &&
                              apiCubit.isContacts,
                          builder: (context) => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              return buildSelectedContactsCard(
                                  apiCubit.contacts!.response.data[index],
                                  index);
                            },
                            itemCount: apiCubit.isSearchingcontactss
                                ? apiCubit
                                    .searchedcontacts!.response.data.length
                                : apiCubit.contacts!.response.data.length,
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
          );
        }),
      ),
    );
  }
}
