// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:mdk_customer/utils/strings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderStates> {
  AddOrderCubit() : super(InitAddOrderState());
  static AddOrderCubit get(context) => BlocProvider.of(context);

  static bool isEn = false;
  bool isAr = !isEn;
  Locale? locale;

  init() async {
    await SharedPreferences.getInstance().then((value) {
      bool? lang = value.getBool('isEn');
      if (lang == null || lang == true) {
        isEn = true;
        changeLocale(Locale('en'));
      } else if (lang == false) {
        isEn = lang;
        changeLocale(Locale('ar'));
      }
      emit(SetinitFanctionstate());
      return value;
    });
  }

  void changeLangu(bool lang) {
    isEn = lang;
    isAr = !isEn;
    emit(ChangeLanguagestate());
  }

  void changeLocale(Locale local) {
    locale = local;
    emit(ChangeLogstate());
  }

  LocaleResolutionCallback localeResolutionCallback =
      (currentLang, supportedLang) {
    if (isEn) {
      return supportedLang.first;
    } else {
      return supportedLang.last;
    }
  };

  bool isSelected = false;
  bool switchvalue = false;
  String dropPickValue = 'DropOff';
  String? newdate;

  void changeSelectedContact() {
    isSelected = !isSelected;
    emit(ChangeSelectedContactstate());
  }

  void changeDropPick(dropOrPick) {
    dropPickValue = dropOrPick;
    emit(ChangeDropOrPickstate());
  }

  String currencyValue = 'LBP';

  void changeCurrency(currency) {
    currencyValue = currency;
    emit(ChangeCurrencystate());
  }

  void collectionSwitch(newSwitchvalue) {
    switchvalue = newSwitchvalue;
    emit(ChangeCollectionSwitchstate());
  }

  void getNewDate(String date) {
    newdate = date;
    emit(ChangeGetNewDatestate());
  }

  void navigateTo(String latlng) async {
    var uri = Uri.parse("google.navigation:q=$latlng&mode=d");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  void makingPhoneCall(number) async {
    var url = Uri.parse('tel:$number');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch ${url.toString()}';
    }
  }

  late XFile imageFile;
  var byte;
  io.File? file;
  void openCamera(BuildContext context) async {
    emit(OpenCamerastate());
    file = null;
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    final path = imageFile!.path;
    final tempDir = await getTemporaryDirectory();

    byte = await io.File(path).readAsBytes().then((value) async {
      file = await io.File('${tempDir.path}/image.jpg').create();
      file!.writeAsBytesSync(value);
    });

    emit(CapturePicturestate());

    Navigator.pop(context);
  }

  void openGallery(BuildContext context) async {
    emit(OpenGalarystate());
    file = null;
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    final path = imageFile!.path;
    final tempDir = await getTemporaryDirectory();

    byte = await io.File(path).readAsBytes().then((value) async {
      file = await io.File('${tempDir.path}/image.jpg').create();
      file!.writeAsBytesSync(value);
    });

    emit(PickPicturestate());

    Navigator.pop(context);
  }
}
