import 'package:flutter/material.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/localization/localizatios.dart';
import 'package:mdk_customer/model/profile_model.dart';

bulidMProfile(context, Data profile) {
  var apiCubit = ApiAppCubit.get(context);
  final formKey = GlobalKey<FormState>();

  TextEditingController firstnameController =
      TextEditingController(text: profile.name);
  TextEditingController userNameController =
      TextEditingController(text: profile.username);
  TextEditingController emailController =
      TextEditingController(text: profile.email);
  TextEditingController mobilenumberController =
      TextEditingController(text: profile.mobile);
  TextEditingController websiteController =
      TextEditingController(text: profile.website);
  TextEditingController addressController =
      TextEditingController(text: profile.address);
  return Form(
    key: formKey,
    child: Column(
      children: [
        TextFormField(
          controller: firstnameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }

            return null;
          },
          maxLines: 1,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            fillColor: Colors.white,
            labelText: getLang(context, "name"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: userNameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your User name';
            }

            return null;
          },
          maxLines: 1,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            fillColor: Colors.white,
            labelText: getLang(context, "userName"),
          ),
        ),
        TextFormField(
          controller: emailController,
          maxLines: 1,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: const UnderlineInputBorder(),
            labelText: getLang(context, "email"),
          ),
        ),
        TextFormField(
          controller: mobilenumberController,
          maxLines: 1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: const UnderlineInputBorder(),
            labelText: getLang(context, "phone"),
          ),
        ),
        TextFormField(
          controller: websiteController,
          maxLines: 2,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: const UnderlineInputBorder(),
            labelText: getLang(context, "webSite"),
          ),
        ),
        TextFormField(
          controller: addressController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your address';
            }

            return null;
          },
          maxLines: 2,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: const UnderlineInputBorder(),
            labelText: getLang(context, "address"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 190,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                primary: const Color(0xff155079),
                minimumSize: const Size.fromHeight(50)),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Data myProfile = Data(
                  id: apiCubit.user!.response.data.id,
                  address: addressController.text.toString(),
                  image: "",
                  email: emailController.text.toString(),
                  mobile: mobilenumberController.text.toString(),
                  name: firstnameController.text.toString(),
                  username: userNameController.text.toString(),
                  website: websiteController.text.toString(),
                  phone: "",
                );
                apiCubit.updateCustomerDetails(context, myProfile: myProfile);
              }
            },
            child: Text(
              getLang(context, "update"),
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "SegoeUI",
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
