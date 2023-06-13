import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget intro_1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: Get.width / 2,
        height: Get.height / 4.4,
        color: Colors.cyan,
        child: SvgPicture.asset(
          'lib/app/modules/onboard_module/assets/logo_1.svg',
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(height: 100),
      const Row(
        children: [
          Text('Security',
              style: TextStyle(
                decoration: TextDecoration.underline,
              )),
        ],
      ),
      const Row(
        children: [
          Text('Control your security', style: TextStyle()),
        ],
      ),
      const Row(
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
  );
}
