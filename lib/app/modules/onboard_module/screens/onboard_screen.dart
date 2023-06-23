// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_manager/app/modules/onboard_module/controller/onboard_controller.dart';
import 'package:password_manager/app/modules/onboard_module/screens/widgets/intro_2.dart';
import 'package:password_manager/app/modules/onboard_module/screens/widgets/intro_3.dart';

import '../../Register_module/controller/registration_controller.dart';
import '../../Register_module/screens/registration.dart';
import 'widgets/intro_1.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final OnboardController onboardcontroller = Get.put(OnboardController());
  final RegistrationController registerController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // implementing PageView Widget for Onboard intro
        child: SingleChildScrollView(
          child: Container(
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

                // Register / Login Buttons
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff292D32)),
                          ),
                          onPressed: () {
                            registerController.currentSelectedTabValue.value =
                                0;
                            Get.to(() => const RegistrationPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'Register',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff292D32)),
                          ),
                          onPressed: () {
                            registerController.currentSelectedTabValue.value =
                                1;
                            Get.to(() => const RegistrationPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'Already have an account',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
