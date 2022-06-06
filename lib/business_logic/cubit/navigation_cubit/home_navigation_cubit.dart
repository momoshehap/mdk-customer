import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/presintaion/screens/subSettings_screen.dart';

import '../../../presintaion/screens/add_order/addOrder_screen.dart';
import '../../../presintaion/screens/contacts_screen.dart';
import '../../../presintaion/screens/home_screen.dart';
import '../../../presintaion/screens/orderSuccess_screen.dart';
import '../../../presintaion/screens/profile_screen.dart';
import '../../../presintaion/screens/settings_screen.dart';
import 'home_navigation_state.dart';

class NavAppCubit extends Cubit<NavappStates> {
  NavAppCubit() : super(InitNavappState());
  static NavAppCubit get(context) => BlocProvider.of(context);

  int navbarIndex = 0;
  int screenIndex = 0;

  List<Widget> screens = const [
    HomeScreen(),
    ProfileScreen(),
    AddOrderScreen(),
    ContactsScreen(),
    SettingScreen(),
    OrderSucces(),
    SubSettingsScreen(),
  ];

  Widget? title;
  void changeTitleAppBar(int index) {
    navbarIndex = index;

    emit(ChangeTitleAppBarstate());
  }

  void changeBottomNavBar(int index) {
    navbarIndex = index;
    screenIndex = index;
    emit(ChangeBottomNavBarstate());
  }

  void callSuccesScreen() {
    screenIndex = 5;
    navbarIndex = 2;

    emit(CallSuccesScreenstate());
  }

  String? activeSubSettingScreen;

  void callSettingsScreen({required String activeSubSettingScreen}) {
    this.activeSubSettingScreen = activeSubSettingScreen;
    screenIndex = 6;
    navbarIndex = 2;

    emit(CallSettingsScreentate());
  }
}
