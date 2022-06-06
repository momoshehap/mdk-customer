import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_states.dart';
import 'package:mdk_customer/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:mdk_customer/model/profile_model.dart';
import 'package:mdk_customer/presintaion/widgets/profile_componants.dart';
import 'package:mdk_customer/utils/strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavAppCubit.get(context).navbarIndex = 0;
        NavAppCubit.get(context).screenIndex = 0;
        Navigator.of(context).pushNamedAndRemoveUntil(
            appMainScreen, (Route<dynamic> route) => false);
        return true;
      },
      child: BlocBuilder<ApiAppCubit, ApiStates>(
        builder: (context, state) {
          var cubit = ApiAppCubit.get(context);

          return SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ConditionalBuilder(
                  condition:
                      state is! NewLoadinGetContactsState && cubit.isprofile,
                  builder: (context) {
                    return bulidMProfile(context, cubit.profile!.response.data);
                  },
                  fallback: (context) => const Center(
                      child: CircularProgressIndicator(
                    color: Color(0xff155079),
                  )),
                )),
          );
        },
      ),
    );
  }
}
  