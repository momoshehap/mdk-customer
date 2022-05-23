import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_state.dart';
import '../../../../utils/strings.dart';

Widget buildSearchbar() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          filled: true,
          hintText: "Search customers",
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
      ),
    ),
  );
}

Widget buildSelectedContactsCard() {
  return BlocProvider(
    create: (context) => AddOrderCubit(),
    child: BlocConsumer<AddOrderCubit, AddOrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AddOrderCubit.get(context);

        return InkWell(
          onTap: () {
            cubit.changeSelectedContact();
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
                                  "Doctor",
                                  style: TextStyle(
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
                                  "Dr. Ali Salha",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xffB2B1B1),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              "+961 1 255 863",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "SegoeUI",
                                color: Color(0xffB2B1B1),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: 'Hamra - ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "SegoeUI",
                                            color: Color(0xffB2B1B1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "Clemenceau street -Clemenceau medicalcenter-Bloc A - 15th floor - Clinic 220",
                                          style: TextStyle(
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
                      ? Image.asset("assets/icons/selected.png")
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

Widget buildBottomOrderBarForOrderScreen(BuildContext context) {
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
                Navigator.of(context).pushNamed(dropOffPickUpScreen);
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

Widget buildDropPickCard() {
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
              child: Container(
                width: double.infinity,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Dr. Ali Salha",
                            style: TextStyle(
                              fontSize: 19,
                              color: Color(0xffB2B1B1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          DropdownButton<String>(
                            value: cubit.dropPickValue,
                            icon: const Icon(Icons.keyboard_arrow_down_sharp),
                            elevation: 16,
                            underline: Container(),
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: cubit.dropPickValue == 'Drop off'
                                  ? Color(0xff004067)
                                  : Colors.red,
                            ),
                            onChanged: (String? value) {
                              cubit.changeDropPick(value);
                            },
                            items: <String>[
                              'Drop off',
                              'Pick up',
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
                        "Doctor",
                        style: TextStyle(
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

Widget buildCollectionCard() {
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
              child: Container(
                width: double.infinity,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Ali Salha",
                            style: TextStyle(
                              fontSize: 19,
                              color: Color(0xffB2B1B1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Doctor",
                            style: TextStyle(
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
                        },
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

Widget buildDeliveryDateCard() {
  return BlocProvider(
    create: (context) => AddOrderCubit(),
    child: BlocConsumer<AddOrderCubit, AddOrderStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Ali Salha",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color(0xffB2B1B1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Doctor",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "SegoeUI",
                        color: Color(0xff004067),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const ImageIcon(
                          AssetImage("assets/icons/calendar.png"),
                          color: Color(0xff707070),
                        ),
                        TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                theme: const DatePickerTheme(
                                  headerColor: Color(0xffB2B1B1),
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true,
                                minTime: DateTime.now(), onConfirm: (date) {
                              // print long date in Spanish format
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

Widget buildNotesCard() {
  return BlocProvider(
    create: (context) => AddOrderCubit(),
    child: BlocConsumer<AddOrderCubit, AddOrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AddOrderCubit.get(context);
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
                        const Text(
                          "Dr. Ali Salha",
                          style: TextStyle(
                            fontSize: 19,
                            color: Color(0xffB2B1B1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Image.asset("assets/icons/mic.png"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/icons/play_voice.png",
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Doctor",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "SegoeUI",
                        color: Color(0xff004067),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: noteController,
                      decoration: const InputDecoration(
                          hintText: "add note ...",
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
              backgroundColor: const Color(0xff155079),
              onPressed: () {
                if (changeState != null) {
                  changeState();
                }
                if (getBack == false) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      nextPage, (Route<dynamic> route) => false);
                } else {
                  Navigator.of(context).pushNamed(nextPage);
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
