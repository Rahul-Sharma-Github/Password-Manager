// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget intro_3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 150,
        width: 150,
        child: SvgPicture.asset(
          'lib/app/modules/onboard_module/assets/logo_3.svg',
          fit: BoxFit.fill,
        ),
      ),
      // const SizedBox(height: 50),
      Container(
        child: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Passblock'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Frictionless Security'),
              ],
            )
          ],
        ),
      ),
    ],
  );
}
