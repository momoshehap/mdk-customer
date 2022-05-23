import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildSearchbar(),
            Expanded(
              child: ConditionalBuilder(
                condition: true,
                builder: (context) => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return buildContactsCard();
                  },
                  itemCount: 10,
                ),
                fallback: (context) => const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xff155079),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
