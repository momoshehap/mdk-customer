import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_states.dart';
import 'package:mdk_customer/localization/localizatios.dart';
import 'package:mdk_customer/model/contact_model.dart' as contacts;
import 'package:mdk_customer/model/order_model.dart';
import 'package:mdk_customer/model/postOrder_model.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_state.dart';
import '../../../../utils/strings.dart';

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

Widget buildSelectedContactsCard(contacts.Data contact, index) {
  return BlocProvider(
    create: (context) => AddOrderCubit(),
    child: BlocConsumer<AddOrderCubit, AddOrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AddOrderCubit.get(context);
        var apicubit = ApiAppCubit.get(context);

        return InkWell(
          onTap: () {
            cubit.changeSelectedContact();

            Orders order = Orders(
              cityName: contact.cityName,
              cityNameAr: contact.cityNameAr,
              customerGPS: contact.customerGPS,
              customerName: contact.customerName,
              customerId: contact.customerId,
              customerType: contact.customerType,
              customerPhone: contact.customerPhone,
              ifWithCollection: false,
              orderType: "DropOff",
              notes: "",
              image: "",
              amount: "",
              currency: "LBP",
              index: 0,
              voice: "",
              voiceNote: "",
              customerAddress: contact.customerAddress,
              date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            );

            if (cubit.isSelected) {
              apicubit.makingorders.add(order);
            }
            if (!cubit.isSelected) {
              apicubit.makingorders.removeWhere((element) => element != order);
              // apicubit.makingorders.removeAt(pos);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
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
                      child: Column(
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
                                    color: const Color(0xff707070),
                                  ),
                                ),
                                Text(
                                  contact.customerName,
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
                            Text(
                              contact.customerPhone,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "SegoeUI",
                                color: Color(0xffB2B1B1),
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
                                        )
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
                Container(
                  child: cubit.isSelected
                      ? SvgPicture.asset("assets/icons/selected.svg")
                      : null,
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}

Future buildSelectContactDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      titleTextStyle: TextStyle(
        fontSize: 17,
        fontFamily: "SegoeUI",
        color: Color(0xff0D4B75),
        fontWeight: FontWeight.bold,
      ),
      title: const Text('Add Customer'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Please select contact",
            style: TextStyle(
              fontSize: 13,
              fontFamily: "SegoeUI",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Ok',
            style: TextStyle(
              fontSize: 17,
              fontFamily: "SegoeUI",
              color: Color(0xff0D4B75),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildBottomOrderBarForOrderScreen(BuildContext context) {
  var apicubit = ApiAppCubit.get(context);

  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      width: double.infinity,
      height: 130,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Container(
              width: 95,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff155079),
              ),
              child: const Text(
                "1 / 6",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: "SegoeUI",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              backgroundColor: const Color(0xff155079),
              onPressed: () {
                if (apicubit.makingorders.isNotEmpty) {
                  Navigator.of(context).pushNamed(dropOffPickUpScreen);
                } else {
                  buildSelectContactDialog(context);
                }
              },
              child: const Icon(
                Icons.arrow_forward_sharp,
                size: 45,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildDropPickCard(Orders contact, index) {
  return BlocProvider(
    create: (context) => AddOrderCubit(),
    child: BlocBuilder<AddOrderCubit, AddOrderStates>(
      builder: (context, state) {
        var cubit = AddOrderCubit.get(context);
        var apiCubit = ApiAppCubit.get(context);

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
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            contact.customerName!,
                            style: const TextStyle(
                              fontSize: 19,
                              color: Color(0xffB2B1B1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          DropdownButton<String>(
                            value: cubit.dropPickValue,
                            icon: const Icon(Icons.keyboard_arrow_down_sharp),
                            elevation: 16,
                            underline: Container(),
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: cubit.dropPickValue == 'DropOff'
                                  ? const Color(0xff004067)
                                  : Colors.red,
                            ),
                            onChanged: (String? value) {
                              cubit.changeDropPick(value);
                              apiCubit.makingorders[index].orderType = value;
                            },
                            items: <String>[
                              'DropOff',
                              'PickUp',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Text(
                        contact.customerType!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "SegoeUI",
                          color: Color(0xff004067),
                          fontWeight: FontWeight.bold,
                        ),
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

Widget buildCollectionCard(Orders contact, int index) {
  return BlocProvider(
    create: (context) => AddOrderCubit(),
    child: BlocConsumer<AddOrderCubit, AddOrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AddOrderCubit.get(context);
        var apicubit = ApiAppCubit.get(context);

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
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.customerName!,
                                style: const TextStyle(
                                  fontSize: 19,
                                  color: Color(0xffB2B1B1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                contact.customerType!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: "SegoeUI",
                                  color: Color(0xff004067),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          CupertinoSwitch(
                            value: cubit.switchvalue,
                            onChanged: (value) {
                              cubit.collectionSwitch(value);
                              apicubit.makingorders[index].ifWithCollection =
                                  value;
                            },
                          ),
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    cubit.switchvalue
                        ? Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.money),
                                  ),
                                  onChanged: (value) {
                                    apicubit.makingorders[index].amount = value;
                                  },
                                ),
                              ),
                              const Spacer(),
                              DropdownButton<String>(
                                value: cubit.currencyValue,
                                icon:
                                    const Icon(Icons.keyboard_arrow_down_sharp),
                                elevation: 16,
                                underline: Container(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff004067),
                                ),
                                onChanged: (String? value) {
                                  cubit.changeCurrency(value);
                                  apicubit.makingorders[index].currency = value;
                                },
                                items: <String>[
                                  'LBP',
                                  'USD',
                                  'EUR',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget buildDeliveryDateCard(Orders contact, index) {
  return BlocProvider(
    create: (context) => AddOrderCubit(),
    child: BlocConsumer<AddOrderCubit, AddOrderStates>(
      listener: (context, state) {},
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
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.customerName!,
                      style: const TextStyle(
                        fontSize: 19,
                        color: Color(0xffB2B1B1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      contact.customerType!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "SegoeUI",
                        color: Color(0xff004067),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/calendar.svg"),
                        TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                theme: const DatePickerTheme(
                                  headerColor: Color(0xffB2B1B1),
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true,
                                minTime: DateTime.now(), onConfirm: (date) {
                              contact.date =
                                  DateFormat.yMMMMd().format(date).toString();
                              cubit.getNewDate(
                                  '${DateFormat.yMMMMd().format(date).toString()}');
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: Row(
                            children: [
                              Text(
                                "${cubit.newdate ?? DateFormat.yMMMMd().format(DateTime.now()).toString()}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffB2B1B1),
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Color(0xffB2B1B1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget buildNotesCard(contexxt, Orders contact, int index) {
  return BlocProvider(
    create: (context) => AddOrderCubit(),
    child: BlocConsumer<AddOrderCubit, AddOrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AddOrderCubit.get(context);
        var apicubit = ApiAppCubit.get(context);

        TextEditingController noteController = TextEditingController();

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
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact.customerName!,
                          style: const TextStyle(
                            fontSize: 19,
                            color: Color(0xffB2B1B1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        contact.customerType!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "SegoeUI",
                          color: Color(0xff004067),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: noteController,
                      onChanged: (value) {
                        apicubit.makingorders[index].notes = value;
                      },
                      decoration: InputDecoration(
                          hintText: getLang(contexxt, "addNote"),
                          border: OutlineInputBorder()),
                      maxLines: 4,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget buildBottomOrderBarForAllScreen({
  required BuildContext context,
  required int pN,
  required String nextPage,
  Function? changeState,
  bool getBack = true,
}) {
  var apiCubit = ApiAppCubit.get(context);

  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      width: double.infinity,
      height: 130,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FloatingActionButton(
              heroTag: "id1",
              backgroundColor: const Color(0xff155079),
              onPressed: () {
                Navigator.pop(context);
                if (nextPage == collectionScreen) {
                  apiCubit.makingorders = [];
                  apiCubit.getContacts();
                }
              },
              child: const Icon(
                Icons.arrow_back,
                size: 45,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 95,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff155079),
              ),
              child: Text(
                "${pN} / 6",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: "SegoeUI",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              heroTag: "id2",
              backgroundColor: const Color(0xff155079),
              onPressed: () {
                if (nextPage == deliveryDateScreen) {}
                if (getBack == false) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      nextPage, (Route<dynamic> route) => false);
                } else {
                  Navigator.of(context).pushNamed(nextPage);
                  print(apiCubit.makingorders[0].orderType);
                }
              },
              child: const Icon(
                Icons.arrow_forward_sharp,
                size: 45,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildBottomOrderBarForlastScreen({
  required BuildContext context,
  required int pN,
  required String nextPage,
  Function? changeState,
  bool getBack = true,
}) {
  var apiCubit = ApiAppCubit.get(context);

  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      width: double.infinity,
      height: 130,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FloatingActionButton(
              backgroundColor: const Color(0xff155079),
              onPressed: () {
                Navigator.pop(context);
                if (nextPage == collectionScreen) {
                  apiCubit.makingorders = [];
                  apiCubit.getContacts();
                }
              },
              child: const Icon(
                Icons.arrow_back,
                size: 45,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 95,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff155079),
              ),
              child: Text(
                "${pN} / 6",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: "SegoeUI",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    ),
  );
}
