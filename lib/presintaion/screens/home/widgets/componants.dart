import 'package:flutter/material.dart';

Widget buildSearchbar() {
  return SizedBox(
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
  );
}

Widget buildCustomerCard() {
  return InkWell(
    onTap: () {},
    child: Padding(
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
          child: Container(
            width: double.infinity,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: const [
                  Text(
                    "#22548",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "SegoeUI",
                      color: Color(0xff004067),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  ImageIcon(
                    AssetImage("assets/icons/Collected.png"),
                    color: Colors.green,
                  ),
                  Text(
                    "Collected",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontFamily: "SegoeUI",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
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
              SizedBox(
                height: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Expanded(
                    child: Text.rich(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    "Pick up ",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "SegoeUI",
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " With collection",
                    style: TextStyle(
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
    ),
  );
}
