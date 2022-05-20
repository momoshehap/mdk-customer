import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderSucces extends StatelessWidget {
  const OrderSucces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Your order is well received.Our drivers are on their way to you",
            style: TextStyle(
              fontSize: 19,
              color: Color(0xffB2B1B1),
              fontFamily: "SegoeUI",
            ),
          ),
          Text(
            "THANK YOU!",
            style: TextStyle(
              fontSize: 19,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xffB707070),
            ),
          ),
        ],
      ),
    );
  }
}
