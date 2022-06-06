import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_states.dart';
import 'package:mdk_customer/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:mdk_customer/presintaion/widgets/contacts_componants.dart';
import 'package:mdk_customer/utils/strings.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
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
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<ApiAppCubit, ApiStates>(
            builder: (context, state) {
              var cubit = ApiAppCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildSearchbar(context),
                  Expanded(
                    child: ConditionalBuilder(
                      condition: state is! NewLoadingCustomersDataState &&
                          state is! NewLoadingShearchCustomersDataState &&
                          cubit.isContacts,
                      builder: (context) => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return buildContactsCard(cubit.isSearchingcontactss
                              ? cubit.searchedcontacts!.response.data[index]
                              : cubit.contacts!.response.data[index]);
                        },
                        itemCount: cubit.isSearchingcontactss
                            ? cubit.searchedcontacts!.response.data.length
                            : cubit.contacts!.response.data.length,
                      ),
                      fallback: (context) => const Center(
                          child: CircularProgressIndicator(
                        color: Color(0xff155079),
                      )),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
