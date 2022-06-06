import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mdk_customer/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:mdk_customer/localization/localizatios.dart';
import '../../business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import '../../business_logic/cubit/navigation_cubit/home_navigation_state.dart';
import '../../utils/strings.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavAppCubit, NavappStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NavAppCubit.get(context);
        var apiCubit = ApiAppCubit.get(context);
        List<Widget> titles = [
          SvgPicture.asset("assets/icons/logoLight.svg"),
          Text(
            getLang(context, "Profile"),
          ),
          const Text(""),
          Text(getLang(context, "Contacts")),
          Text(getLang(context, "Settings")),
          Text(getLang(context, "OrderSuccess")),
          Text(
            cubit.activeSubSettingScreen == "about"
                ? getLang(context, "AboutMDK")
                : cubit.activeSubSettingScreen == "support"
                    ? getLang(context, "Support")
                    : cubit.activeSubSettingScreen == "Statistics"
                        ? getLang(context, "Statistics")
                        : getLang(context, "MDKDriver"),
          ),
        ];
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: titles[cubit.screenIndex],
              centerTitle: true,
              leading: Container(),
              backgroundColor: const Color(0xff155079),
              toolbarHeight: 81,
            ),
            body: cubit.screens[cubit.screenIndex],
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xff155079),
              onPressed: () {
                apiCubit.makingorders = [];
                Navigator.of(context).pushNamed(addorderScreen);
              },
              tooltip: 'Add Order',
              elevation: 4.0,
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: const Color(0xff155079),
              showUnselectedLabels: true,
              currentIndex: cubit.navbarIndex,
              onTap: (index) {
                if (index != 2) {
                  cubit.changeBottomNavBar(index);
                  cubit.changeTitleAppBar(index);
                  if (index == 0) {
                    ApiAppCubit.get(context).getOrders();
                  }
                  if (index == 1) {
                    ApiAppCubit.get(context).getMyProfile();
                  }
                  if (index == 3) {
                    ApiAppCubit.get(context).getContacts();
                  }
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Expanded(
                    child: SvgPicture.asset(
                      "assets/icons/home.svg",
                      color: cubit.navbarIndex == 0
                          ? const Color(0xff155079)
                          : Colors.grey,
                    ),
                  ),
                  label: getLang(context, "Home"),
                ),
                BottomNavigationBarItem(
                  icon: Expanded(
                    child: SvgPicture.asset(
                      "assets/icons/profile.svg",
                      color: cubit.navbarIndex == 1
                          ? const Color(0xff155079)
                          : Colors.grey,
                    ),
                  ),
                  label: getLang(context, "navProfile"),
                ),
                const BottomNavigationBarItem(
                  icon: Expanded(
                    child: Text(""),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Expanded(
                    child: SvgPicture.asset(
                      "assets/icons/contacts.svg",
                      color: cubit.navbarIndex == 3
                          ? const Color(0xff155079)
                          : Colors.grey,
                    ),
                  ),
                  label: getLang(context, "Contacts"),
                ),
                BottomNavigationBarItem(
                  icon: Expanded(
                    child: SvgPicture.asset(
                      "assets/icons/settings.svg",
                      color: cubit.navbarIndex == 4
                          ? const Color(0xff155079)
                          : Colors.grey,
                    ),
                  ),
                  label: getLang(context, "Settings"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
