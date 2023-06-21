import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/onboard_module/screens/onboard_screen.dart';

import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    tools: const [...DevicePreview.defaultTools],
    builder: (context) => const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Password Manager',
      initialRoute: '/',
      theme: ThemeData(primaryColor: const Color(0xff292D32)),
      home: OnboardScreen(),
    );
  }
}
