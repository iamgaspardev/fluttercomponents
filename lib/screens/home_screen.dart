import 'package:flutter/material.dart';
import 'package:malaria_survillance_app/shared/components/button.dart';
import 'package:malaria_survillance_app/shared/components/selector.dart';
import 'package:malaria_survillance_app/shared/components/text_field.dart';
import '../shared/components/organization_unit_tree.dart';
import '../shared/widgets/geoMap.dart';
import '../shared/widgets/map_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedDropdownItem = 'Option 1';
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MapComponent(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.87,
                child: CustomGeoMap(),
              ),
              // TextFieldComponent(
              //   label: 'Name',
              //   hintText: 'Enter name',
              //   controller: nameController,
              //   inputType: TextInputType.text,
              // ),
              // SizedBox(height: 20),
              // TextFieldComponent(
              //   label: 'Phone Number',
              //   hintText: 'Enter phone number',
              //   controller: numberController,
              //   inputType: TextInputType.phone,
              // ),
              // SizedBox(height: 20),
              // TextFieldComponent(
              //   label: 'Email',
              //   hintText: 'Enter email',
              //   controller: emailController,
              //   inputType: TextInputType.emailAddress,
              // ),
              // SizedBox(height: 20),
              // TextFieldComponent(
              //   label: 'Password',
              //   hintText: 'Enter password',
              //   controller: passwordController,
              //   inputType: TextInputType.visiblePassword,
              // ),
              // SizedBox(height: 20),
              // Text('Select Option:'),
              // SizedBox(height: 8),
              // SelectorComponent(
              //   items: dropdownItems,
              //   selectedItem: selectedDropdownItem,
              //   onChanged: (value) {
              //     setState(() {
              //       selectedDropdownItem = value!;
              //     });
              //   },
              // ),
              // SizedBox(height: 20),
              // ButtonComponent(
              //   text: 'Submit',
              //   onPressed: () {
              //     print('Name: ${nameController.text}');
              //     print('Phone Number: ${numberController.text}');
              //     print('Email: ${emailController.text}');
              //     print('Password: ${passwordController.text}');
              //   },
              // ),
              // SizedBox(height: 20),
              // Text('Organization Unit Tree:'),
              // OrganizationUnitTree(),
            ],
          ),
        ),
      ),
    );
  }
}
