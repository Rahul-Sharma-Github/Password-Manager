// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget intro_1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        flex: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 10,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                Container(
                  height: 10,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                Container(
                  height: 10,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            child: SvgPicture.asset(
              'lib/app/modules/onboard_module/assets/logo_1.svg',
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      // const SizedBox(height: 100),
      Expanded(
        flex: 2,
        child: Container(
          // alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Security',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
              Row(
                children: [
                  Text('Control your security', style: TextStyle()),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      softWrap: true,
                      maxLines: 4,
                      'This application is build on blockchain so that you can get 100% security across websites & applications with single app.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
