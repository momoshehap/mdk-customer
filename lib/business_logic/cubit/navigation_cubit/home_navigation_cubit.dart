import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presintaion/screens/add_order/addOrder_screen.dart';
import '../../../presintaion/screens/contacts/contacts_screen.dart';
import '../../../presintaion/screens/home/home_screen.dart';
import '../../../presintaion/screens/orderSuccess_screen.dart';
import '../../../presintaion/screens/profile/profile_screen.dart';
import '../../../presintaion/screens/settings_screen.dart';
import 'home_navigation_state.dart';

class NavAppCubit extends Cubit<NavappStates> {
  NavAppCubit() : super(InitNavappState());
  static NavAppCubit get(context) => BlocProvider.of(context);

  List<Widget> titles = [
    Image.asset("assets/icons/logoLight.png"),
    Text("My Profile"),
    Text(""),
    Text("Contacts"),
    Text("Settings"),
    Text("Order Success"),
  ];

  int navbarIndex = 0;
  int ScreenIndex = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Expanded(
        child: ImageIcon(
          AssetImage("assets/icons/home.png"),
        ),
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Expanded(
        child: ImageIcon(
          AssetImage("assets/icons/profile.png"),
        ),
      ),
      label: "profile",
    ),
    BottomNavigationBarItem(
      icon: Expanded(
        child: Text(""),
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Expanded(
        child: ImageIcon(
          AssetImage("assets/icons/contacts.png"),
        ),
      ),
      label: "contacts",
    ),
    BottomNavigationBarItem(
      icon: Expanded(
        child: ImageIcon(
          AssetImage("assets/icons/settimg.png"),
        ),
      ),
      label: "setting",
    ),
  ];

  List<Widget> screens = const [
    HomeScreen(),
    ProfileScreen(),
    AddOrderScreen(),
    ContactsScreen(),
    SettingScreen(),
    OrderSucces(),
  ];

  Widget? title;
  void changeTitleAppBar(int index) {
    navbarIndex = index;

    emit(ChangeTitleAppBarstate());
  }

  void changeBottomNavBar(int index) {
    navbarIndex = index;
    ScreenIndex = index;
    emit(ChangeBottomNavBarstate());
  }

  void callSuccesScreen() {
    ScreenIndex = 5;
    navbarIndex = 2;

    emit(CallSuccesScreenstate());
  }
}
