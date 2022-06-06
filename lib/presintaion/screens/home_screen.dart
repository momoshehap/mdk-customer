import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_states.dart';
import 'package:mdk_customer/presintaion/widgets/home_componants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiAppCubit, ApiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var apiCubit = ApiAppCubit.get(context);

        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                buildSearchbar(context),
                Expanded(
                  child: ConditionalBuilder(
                    condition: state is! NewLoadinGetOrdersDataState &&
                        state is! NewLoadingGetSearchedOrdersDataState &&
                        apiCubit.isorders,
                    builder: (context) => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return buildCustomerCard(
                          context,
                          apiCubit.isSearchingOrders
                              ? apiCubit.searchedorders!.response.data[index]
                              : apiCubit.orders!.response.data[index],
                        );
                      },
                      itemCount: apiCubit.isSearchingOrders
                          ? apiCubit.searchedorders!.response.data.length
                          : apiCubit.orders!.response.data.length,
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
      },
    );
  }
}
