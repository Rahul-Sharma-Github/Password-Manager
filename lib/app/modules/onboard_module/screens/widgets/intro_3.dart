import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget intro_3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: Get.width / 2,
        height: Get.height / 4.4,
        color: Colors.cyan,
        child: SvgPicture.asset(
          'lib/app/modules/onboard_module/assets/logo_3.svg',
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(height: 50),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Passblock'),
        ],
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Frictionless Security'),
        ],
      ),
    ],
  );
}
