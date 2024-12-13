import 'package:flutter/material.dart';

import '../shared/components/button.dart';
import '../shared/components/text_field.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            const Text(
              "MS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
            ),
            const Text(
              "Zanzibar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text('Enter Username'),
                      const SizedBox(height: 8),
                      TextFieldComponent(
                        hintText: 'Enter usernsme',
                        controller: textController,
                        inputType: TextInputType.text,
                      ),
                      const Text('Enter Password'),
                      const SizedBox(height: 8),
                      TextFieldComponent(
                        hintText: 'Enter password',
                        controller: textController,
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ButtonComponent(
                          text: 'Ingia',
                          onPressed: () {
                            print('Button Pressed');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
