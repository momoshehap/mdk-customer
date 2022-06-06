import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mdk_customer/business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import 'package:mdk_customer/business_logic/cubit/add_order_cubit/add_order_state.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_states.dart';
import 'package:mdk_customer/localization/localizatios.dart';
import 'package:mdk_customer/model/order_model.dart';

Widget buildSearchbar(context) {
  return BlocListener<ApiAppCubit, ApiStates>(
    listener: (context, state) {
      if (state is GetSearchedOrdersDataSuccessState) {
        ApiAppCubit.get(context).isSearchingOrders = true;
        print("GetSearchedOrdersDataSuccessState");
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 48,
        child: TextField(
          onChanged: (value) {
            ApiAppCubit.get(context).searchOrder(q: value);
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

Widget buildCustomerCard(BuildContext context, Data order) {
  return InkWell(
    onTap: () {
      buildCustomerDialog(context, order);
    },
    child: BlocBuilder<AddOrderCubit, AddOrderStates>(
      builder: (context, state) {
        var ordercubit = AddOrderCubit.get(context);
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
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(
                    children: [
                      Text(
                        "#${order.orderId}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontFamily: "SegoeUI",
                          color: Color(0xff004067),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        order.StatusName,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                          fontFamily: "SegoeUI",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        ordercubit.isAr
                            ? order.ArcustomerType
                            : order.customerType,
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
                          color: const Color(0xff707070),
                        ),
                      ),
                      Text(
                        order.customerName,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xffB2B1B1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
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
                                    '${ordercubit.isAr ? order.arCityName : order.cityname} - ',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SegoeUI",
                                  color: Color(0xffB2B1B1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ordercubit.isAr
                                    ? order.ArAddress
                                    : order.Address,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontFamily: "SegoeUI",
                                  color: Color(0xffB2B1B1),
                                ),
                              )
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        ordercubit.isAr ? order.ArOrderType : order.orderType,
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: "SegoeUI",
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        order.amount != ""
                            ? "${order.amount} ${order.currency} With collection"
                            : "",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Future<dynamic> buildCustomerDialog(cnxt, Data order) {
  return showDialog(
    barrierDismissible: false,
    context: cnxt,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white.withOpacity(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: BlocBuilder<AddOrderCubit, AddOrderStates>(
          builder: (context, state) {
            var ordercubit = AddOrderCubit.get(context);
            return SizedBox(
              height: 330,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: order.notes == "" ? 261 : 270,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
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
                                      "#${order.orderId}",
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: "SegoeUI",
                                        color: Color(0xff004067),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      order.StatusName,
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 13,
                                        fontFamily: "SegoeUI",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ordercubit.isAr
                                          ? order.ArcustomerType
                                          : order.customerType,
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
                                        color: const Color(0xff707070),
                                      ),
                                    ),
                                    Text(
                                      order.customerName,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xffB2B1B1),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset("assets/icons/number.svg",
                                        color: const Color(0xff004067)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        cubit.makingPhoneCall(
                                            order.customerPhone);
                                      },
                                      child: Text(
                                        order.customerPhone,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "SegoeUI",
                                          color: Color(0xffB2B1B1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
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
                                                  '${ordercubit.isAr ? order.arCityName : order.cityname} - ',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: "SegoeUI",
                                                color: Color(0xffB2B1B1),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ordercubit.isAr
                                                  ? order.ArAddress
                                                  : order.Address,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontFamily: "SegoeUI",
                                                color: Color(0xffB2B1B1),
                                              ),
                                            )
                                          ],
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ordercubit.isAr
                                          ? order.ArOrderType
                                          : order.orderType,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: "SegoeUI",
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      order.amount != ""
                                          ? "${order.amount} ${order.currency} With collection"
                                          : "",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  getLang(context, "notes"),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    color: Color(0xff004067),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  order.notes,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    color: Color(0xff004067),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ]);
                        }),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Positioned(
                      top: 0,
                      child: SvgPicture.asset(("assets/icons/dismiss.svg")),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
