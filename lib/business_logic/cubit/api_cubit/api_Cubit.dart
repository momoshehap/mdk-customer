import 'dart:convert';
import 'package:mdk_customer/model/contact_model.dart';
import 'package:mdk_customer/model/mdkDriver_model.dart';
import 'package:mdk_customer/model/postOrder_model.dart';
import 'package:mdk_customer/model/profile_model.dart' as profileM;
import 'package:mdk_customer/model/order_model.dart';
import 'package:mdk_customer/model/user_model.dart';
import 'package:mdk_customer/service/api.dart';
import 'package:mdk_customer/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'api_states.dart';

class ApiAppCubit extends Cubit<ApiStates> {
  ApiAppCubit() : super(InitApiappState());
  static ApiAppCubit get(context) => BlocProvider.of(context);
  init() async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();
    String? userData = userPrefs.getString('userData');
    if (userData == null) {
    } else {
      Map<String, dynamic> jsonString = json.decode(userData);
      User savedUser = User.fromJson(jsonString);
      user = savedUser;
      getOrders();
    }
  }

  String loginpath = "customer_login";
  int? status;
  User? user;
  bool isLogin = false;
  Future getLoginData({
    required BuildContext context,
    required String userName,
    required String password,
  }) async {
    emit(NewLoginLoadingState());

    Helper.getData(
      url: loginpath,
      query: {
        'username': userName,
        'password': password,
      },
    ).then((value) async {
      print(value.data["response"]["data"]);
      int status = value.data["response"]["status"];
      if (status == 0) {
        emit(GetwrongAccountState());
      } else {
        user = User.fromJson(value.data);
         getOrders() ;
        emit(GetLoginDataSuccessState());
        SharedPreferences userPrefs = await SharedPreferences.getInstance();
        userPrefs.setString(
            'userData', jsonEncode(ApiAppCubit.get(context).user!.toJson()));
        isLogin = true;
        
      }
    }).catchError((e) {
      print(e);
      emit(GetLoginDataErorrState(e.toString()));
    });
  }

  String customerOrderPath = "customer_order";
  Order? orders;
  bool isorders = false;

  Future getOrders() async {
    emit(NewLoadinGetOrdersDataState());

    Helper.getData(
      url: customerOrderPath,
      query: {
        'customerId': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      orders = Order.fromJson(value.data);
      isorders = true;
      print(value.data);

      emit(GetOrdersDataSuccessState());
    }).catchError((e) {
      print(e);

      emit(GetOrdersDataErorrState(e.toString()));
    });
  }

  Order? searchedorders;
  bool isSearchingOrders = false;
  Future searchOrder({
    required String q,
  }) async {
    emit(NewLoadingShearchCustomersDataState());

    Helper.getData(
      url: customerOrderPath,
      query: {
        'customerId': user!.response.data.id,
        "search": q,
      },
      header: user!.response.data.token,
    ).then((value) {
      searchedorders = Order.fromJson(value.data);
      print("searched data is here");
      emit(GetSearchedOrdersDataSuccessState());
    }).catchError((e) {
      print("searched data isnot here");

      emit(GetSearchedOrdersDataErorrState(e.toString()));
    });
  }

  String customersPath = "receiverCustomer";
  Contact? contacts;
  bool isContacts = false;

  Future getContacts() async {
    emit(NewLoadingCustomersDataState());
    Helper.getData(
      url: customersPath,
      query: {
        'id': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      contacts = Contact.fromJson(value.data);
      isContacts = true;
      emit(GetCustomerDataSuccessState());
    }).catchError((e) {
      emit(GetCustomerDataErorrState(e.toString()));
    });
  }

  Contact? searchedcontacts;
  bool isSearchingcontactss = false;
  Future searchContacts({
    required String q,
  }) async {
    emit(NewLoadingShearchCustomersDataState());

    Helper.getData(
      url: customersPath,
      query: {
        'id': user!.response.data.id,
        "search": q,
      },
      header: user!.response.data.token,
    ).then((value) {
      searchedcontacts = Contact.fromJson(value.data);
      isContacts = true;
      emit(GetSearchedCustomerDataSuccessState());
    }).catchError((e) {
      emit(GetSearchedCustomerDataErorrState(e.toString()));
    });
  }

  String profilePath = "getCustomerById";
  profileM.Profile? profile;
  bool isprofile = false;

  Future getMyProfile() async {
    emit(NewLoadinGetContactsState());

    Helper.getData(
      url: profilePath,
      query: {
        'id': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      profile = profileM.Profile.fromJson(value.data);
      isprofile = true;
      emit(GetContactsSuccessState());
    }).catchError((e) {
      emit(GetContactsErorrState(e.toString()));
    });
  }

  String mdkDriverPath = "MdkDriver";
  MdkDriver? mdkDrivers;
  bool ismdkDriver = false;

  Future getMyMdkDriver() async {
    emit(NewLoadinMdkDriverState());

    Helper.getData(
      url: mdkDriverPath,
      query: {
        'id': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      mdkDrivers = MdkDriver.fromJson(value.data);
      ismdkDriver = true;
      emit(GetMdkDriverSuccessState());
    }).catchError((e) {
      emit(GetMdkDriverErorrState(e.toString()));
    });
  }

  String statisticsPath = "statistics";
  String? statistics;
  bool isstatistics = false;

  Future getMyStatistics() async {
    emit(NewLoadinStatisticsState());

    Helper.getData(
      url: statisticsPath,
      query: {
        'id': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      statistics = value.data["response"]["data"]["total_number_of_orders"];
      print(statistics);
      isstatistics = true;
      emit(GetStatisticsSuccessState());
    }).catchError((e) {
      emit(GetStatisticsErorrState(e.toString()));
    });
  }

  String updateCustomerPath = "updateCustomerDetails";
  Future updateCustomerDetails(
    context, {
    required profileM.Data myProfile,
  }) async {
    emit(NewLoadingUpDateCustomerDataState());

    Helper.sendPost(
      url: updateCustomerPath,
      query: myProfile.toJson(),
      header: user!.response.data.token,
    ).then((value) {
      emit(UpDateCustomerDataSuccessState());

      print(value.data['response']['updated']);
      if (value.data['response']['updated'] == 1) {
        getMyProfile().then((value) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0xff155079),
            content: Text("Profile Detailes Updated Successfuly"),
          ));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color(0xff155079),
          content: Text("Some Thing Went Wrong Please Try Again"),
        ));
      }
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color(0xff155079),
        content: Text("Some Thing Went Wrong Please Try Again"),
      ));
      emit(UpDateCustomerDataErorrState(e.toString()));
    });
  }

  late List<Orders> makingorders = [];
  String? image;
  String makeOrderPath = "makeOrder";
  Future makeOrder(
    context,
  ) async {
    emit(NewLoadingUpDateCustomerDataState());
    PostOrder? postorders = PostOrder(
      id: user!.response.data.id,
      image: "image",
      orders: makingorders,
    );

    Helper.sendPost(
      url: makeOrderPath,
      query: postorders.toJson(),
      header: user!.response.data.token,
    ).then((value) {
      emit(UpDateCustomerDataSuccessState());
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color(0xff155079),
        content: Text("some Thing went Wrong , Try Again"),
      ));
      emit(UpDateCustomerDataErorrState(e.toString()));
    });
  }

  Future<Position> getCurrentLocation() async {
    emit(NewLoadinggetCurrentLocationState());

    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.requestPermission();
      emit(GetCurrentLocationSuccessState());
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
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
}
