import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget intro_2() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: Get.width / 2,
        height: Get.height / 4.4,
        color: Colors.cyan,
        child: SvgPicture.asset(
          'lib/app/modules/onboard_module/assets/logo_2.svg',
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(height: 100),
      const Row(
        children: [
          Text('Fast',
              style: TextStyle(
                decoration: TextDecoration.underline,
              )),
        ],
      ),
      const Row(
        children: [
          Text('Everything in single click', style: TextStyle()),
        ],
      ),
      const Row(
        children: [
          Expanded(
            child: Text(
              softWrap: true,
              maxLines: 4,
              'Add, genreate, store, transfer, sync, export & copy all your passwords in single click. Use autofill for quick action without opening app.',
            ),
          ),
        ],
      ),
    ],
  );
}
