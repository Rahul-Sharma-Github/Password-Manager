// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/app/modules/onboard_module/controller/onboard_controller.dart';
import 'package:password_manager/app/modules/onboard_module/screens/widgets/intro_2.dart';
import 'package:password_manager/app/modules/onboard_module/screens/widgets/intro_3.dart';

import 'widgets/intro_1.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final OnboardController onboardcontroller = Get.put(OnboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // implementing PageView Widget for Onboard intro
        child: Container(
          height: Get.mediaQuery.size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Get.mediaQuery.size.height / 1.40,
                child: PageView(
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  controller: onboardcontroller.pageController,
                  children: [
                    intro_1(),
                    intro_2(),
                    intro_3(),
                  ],
                  onPageChanged: (value) {
                    onboardcontroller.currentIndex.value = value;
                  },
                ),
              ),
              Expanded(
                child: Container(
                  // height: Get.height / 1.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text('Register'),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text('Already have an account'),
                          ),
                        ),
                      ],
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
