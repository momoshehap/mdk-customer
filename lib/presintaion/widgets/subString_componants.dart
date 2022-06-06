import 'package:flutter/material.dart';
import 'package:mdk_customer/model/mdkDriver_model.dart';

Widget buildMdkDriverCard(Data driver) {
  return Container(
    height: 100,
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
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Name : ",
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xff707070),
                  fontWeight: FontWeight.bold,
                  fontFamily: "SegoeUI",
                ),
              ),
              Text(
                driver.driverName,
                style: const TextStyle(
                  fontSize: 19,
                  fontFamily: "SegoeUI",
                  fontWeight: FontWeight.bold,
                  color: Color(0xff155079),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                "Email : ",
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xff707070),
                  fontWeight: FontWeight.bold,
                  fontFamily: "SegoeUI",
                ),
              ),
              Text(
                driver.email,
                style: const TextStyle(
                  fontSize: 19,
                  fontFamily: "SegoeUI",
                  fontWeight: FontWeight.bold,
                  color: Color(0xff155079),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                "Mobile : ",
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xff707070),
                  fontWeight: FontWeight.bold,
                  fontFamily: "SegoeUI",
                ),
              ),
              Text(
                driver.mobile,
                style: const TextStyle(
                  fontSize: 19,
                  fontFamily: "SegoeUI",
                  fontWeight: FontWeight.bold,
                  color: Color(0xff155079),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
