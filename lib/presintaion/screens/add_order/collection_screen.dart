import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:mdk_customer/presintaion/screens/add_order/widgets/componants.dart';
import '../../../utils/strings.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collection"),
        centerTitle: true,
        backgroundColor: const Color(0xff155079),
        toolbarHeight: 81,
        leading: Container(),
      ),
      body: SizedBox(
        height: h,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 70),
              child: Expanded(
                child: ConditionalBuilder(
                  condition: true,
                  builder: (context) => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return buildCollectionCard();
                    },
                    itemCount: 10,
                  ),
                  fallback: (context) => const Center(
                      child: CircularProgressIndicator(
                    color: Color(0xff155079),
                  )),
                ),
              ),
            ),
            buildBottomOrderBarForAllScreen(
              context: context,
              pN: 3,
              nextPage: deliveryDateScreen,
            ),
          ],
        ),
      ),
    );
  }
}
