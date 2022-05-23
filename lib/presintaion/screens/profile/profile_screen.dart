import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final formKey = GlobalKey<FormState>();
  String dropdownValue = 'Doctor';
  String citydropdownValue = 'Hamra';

  TextEditingController firstnameController =
      TextEditingController(text: "Lara");
  TextEditingController lastnameController =
      TextEditingController(text: "Saykali");
  TextEditingController typeController = TextEditingController();

  TextEditingController usernameController =
      TextEditingController(text: "larasaykali@gmail.com");
  TextEditingController mobilenumberController =
      TextEditingController(text: "+961 1 223 633");
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController(
      text:
          "Clemenceau street -Clemenceau medicalcenter-Bloc A - 15th floor - Clinic 220 ");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: firstnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }

                  return null;
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  fillColor: Colors.white,
                  labelText: "First Name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: lastnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }

                  return null;
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  fillColor: Colors.white,
                  labelText: "Last Name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      elevation: 16,
                      underline: Container(
                          width: double.infinity,
                          height: 1,
                          color: const Color(0xFF000000)),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Doctor',
                        'Lab',
                        'Supplier',
                        'Supplier',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: usernameController,
                validator: (value) => EmailValidator.validate(value!)
                    ? null
                    : "Please enter a valid email",
                maxLines: 1,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  labelText: "UserName",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: mobilenumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile';
                  }

                  return null;
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  labelText: "mobile",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "City",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      value: citydropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      elevation: 16,
                      underline: Container(
                          width: double.infinity,
                          height: 1,
                          color: const Color(0xFF000000)),
                      onChanged: (String? newValue) {
                        setState(() {
                          citydropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Hamra',
                        'Airport',
                        'Ashrafieh',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }

                  return null;
                },
                maxLines: 2,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  labelText: "Address",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 190,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      primary: const Color(0xff155079),
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "SegoeUI",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
