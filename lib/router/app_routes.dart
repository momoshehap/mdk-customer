import 'package:flutter/material.dart';

import '../main.dart';
import '../presintaion/screens/add_order/addOrder_screen.dart';
import '../presintaion/screens/add_order/collection_screen.dart';
import '../presintaion/screens/add_order/delivery_date_screen.dart';
import '../presintaion/screens/add_order/dropOff_pickUp_screen.dart';
import '../presintaion/screens/add_order/notes_screen.dart';
import '../presintaion/screens/add_order/order_picture_screen.dart';
import '../presintaion/screens/appMain_screen.dart';
import '../presintaion/screens/contacts_screen.dart';
import '../presintaion/screens/home_screen.dart';
import '../presintaion/screens/login_screen.dart';
import '../presintaion/screens/orderSuccess_screen.dart';
import '../presintaion/screens/profile_screen.dart';
import '../presintaion/screens/settings_screen.dart';
import '../utils/strings.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case mainn:
        return MaterialPageRoute(
          builder: (_) => const MyApp(),
        );
      case appMainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainAppScreen(),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case contactsScreen:
        return MaterialPageRoute(
          builder: (_) => const ContactsScreen(),
        );
      case settingsScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );

      case addorderScreen:
        return MaterialPageRoute(
          builder: (_) => const AddOrderScreen(),
        );
      case dropOffPickUpScreen:
        return MaterialPageRoute(
          builder: (_) => const DropOffPickUpScreen(),
        );

      case collectionScreen:
        return MaterialPageRoute(
          builder: (_) => const CollectionScreen(),
        );

      case deliveryDateScreen:
        return MaterialPageRoute(
          builder: (_) => const DeliveryDateScreen(),
        );
      case notesScreen:
        return MaterialPageRoute(
          builder: (_) => const NotesScreen(),
        );
      case orderPictureScreen:
        return MaterialPageRoute(
          builder: (_) => OrderPictureScreen(),
        );

      case orderSucces:
        return MaterialPageRoute(
          builder: (_) => const OrderSucces(),
        );
      default:
        return null;
    }
  }
}
