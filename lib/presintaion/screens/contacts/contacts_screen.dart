import 'package:flutter/material.dart';
import 'package:mdk_customer/presintaion/screens/contacts/widgets/componants.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSearchbar(),
              buildCustomerCard(),
              buildCustomerCard(),
              buildCustomerCard(),
              buildCustomerCard(),
              buildCustomerCard(),
            ],
          ),
        ),
      ),
    );
  }
}