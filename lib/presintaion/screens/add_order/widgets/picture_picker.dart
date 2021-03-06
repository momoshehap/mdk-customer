import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_cubit.dart';
import '../../../../business_logic/cubit/add_order_cubit/add_order_state.dart';

Future<void> pickPictureDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<AddOrderCubit, AddOrderStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AddOrderCubit.get(context);

            return AlertDialog(
              title: const Text(
                "Choose option",
                style: TextStyle(color: Colors.blue),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    const Divider(
                      height: 1,
                      color: Colors.blue,
                    ),
                    ListTile(
                      onTap: () {
                        cubit.openGallery(context);
                      },
                      title: const Text("Gallery"),
                      leading: const Icon(
                        Icons.account_box,
                        color: Colors.blue,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.blue,
                    ),
                    ListTile(
                      onTap: () {
                        cubit.openCamera(context);
                      },
                      title: const Text("Camera"),
                      leading: const Icon(
                        Icons.camera,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}
