import 'package:flutter/material.dart';
import 'package:malaria_survillance_app/screens/main_screen.dart';
import 'package:malaria_survillance_app/screens/sign_in.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malaria Survillance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
