import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdk_customer/router/app_routes.dart';
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

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: cubit.titles[cubit.ScreenIndex],
              centerTitle: true,
              backgroundColor: const Color(0xff155079),
              toolbarHeight: 81,
            ),
            body: cubit.screens[cubit.ScreenIndex],
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xff155079),
              onPressed: () {
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
                }
              },
              items: cubit.items,
            ),
          ),
        );
      },
    );
  }
}
