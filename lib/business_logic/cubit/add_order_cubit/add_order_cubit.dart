import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presintaion/screens/add_order/addOrder_screen.dart';
import '../../../presintaion/screens/contacts/contacts_screen.dart';
import '../../../presintaion/screens/home/home_screen.dart';
import '../../../presintaion/screens/orderSuccess_screen.dart';
import '../../../presintaion/screens/profile/profile_screen.dart';
import '../../../presintaion/screens/setting/settings_screen.dart';
import 'add_order_state.dart';
// import 'package:image_picker/image_picker.dart';

class AddOrderCubit extends Cubit<AddOrderStates> {
  AddOrderCubit() : super(InitAddOrderState());
  static AddOrderCubit get(context) => BlocProvider.of(context);
  bool isSelected = false;
  bool switchvalue = true;
  String dropPickValue = 'Drop off';
  String? newdate;

  void changeSelectedContact() {
    isSelected = !isSelected;
    emit(ChangeSelectedContactstate());
  }

  void changeDropPick(dropOrPick) {
    dropPickValue = dropOrPick;
    emit(ChangeDropOrPickstate());
  }

  void collectionSwitch(newSwitchvalue) {
    switchvalue = newSwitchvalue;
    emit(ChangeCollectionSwitchstate());
  }

  void getNewDate(String date) {
    newdate = date;
    emit(ChangeGetNewDatestate());
  }

  // late XFile imageFile;

  // void openCamera(BuildContext context) async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //   );
  //   if (pickedFile != null) {
  //     imageFile = pickedFile;
  //   }
  //   Navigator.pop(context);
  //   emit(PickPicturestate());
  // }

  // void openGallery(BuildContext context) async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (pickedFile != null) {
  //     imageFile = pickedFile;
  //   }

  //   Navigator.pop(context);
  // }
}
