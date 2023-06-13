import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/onboard_module/screens/onboard_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Password Manager',
      initialRoute: '/',
      home: OnboardScreen(),
    );
  }
}
