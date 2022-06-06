import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mdk_customer/business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import 'package:mdk_customer/business_logic/cubit/add_order_cubit/add_order_state.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_states.dart';
import 'package:mdk_customer/localization/localizatios.dart';
import 'package:mdk_customer/model/contact_model.dart';

Widget buildSearchbar(context) {
  return BlocListener<ApiAppCubit, ApiStates>(
    listener: (context, state) {
      if (state is NewLoadingShearchCustomersDataState) {
        ApiAppCubit.get(context).isSearchingcontactss = true;
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 48,
        child: TextField(
          onChanged: (value) {
            ApiAppCubit.get(context).searchContacts(q: value);
            print(value.isEmpty);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            filled: true,
            hintText: getLang(context, "search"),
            prefixIcon: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildContactsCard(Data contact) {
  return BlocBuilder<AddOrderCubit, AddOrderStates>(
    builder: (context, state) {
      var cubit = AddOrderCubit.get(context);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(
                  2.0,
                  2.0,
                ), //Offset
                blurRadius: 5.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
            child: SizedBox(
              width: double.infinity,
              child: BlocBuilder<AddOrderCubit, AddOrderStates>(
                  builder: (context, state) {
                var cubit = AddOrderCubit.get(context);
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            cubit.isAr
                                ? contact.ArcustomerType
                                : contact.customerType,
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "SegoeUI",
                                color: Color(0xff004067),
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 15,
                              width: 2,
                              color: Color(0xff707070),
                            ),
                          ),
                          Text(
                            contact.customerName,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xffB2B1B1),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              ApiAppCubit.get(context)
                                  .navigateTo(contact.customerGPS);
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/location.svg",
                              color: const Color(0xff004067),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      TextButton(
                        onPressed: () {
                          cubit.makingPhoneCall(contact.customerPhone);
                        },
                        child: Text(
                          contact.customerPhone,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: "SegoeUI",
                            color: Color(0xffB2B1B1),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text:
                                        '${cubit.isAr ? contact.cityNameAr : contact.cityName} - ',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "SegoeUI",
                                      color: Color(0xffB2B1B1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: cubit.isAr
                                        ? contact.ArAddress
                                        : contact.customerAddress,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontFamily: "SegoeUI",
                                      color: Color(0xffB2B1B1),
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ]);
              }),
            ),
          ),
        ),
      );
    },
  );
}
