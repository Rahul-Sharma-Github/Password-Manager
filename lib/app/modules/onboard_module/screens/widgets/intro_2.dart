// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget intro_2() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            width: 200,
            child: SvgPicture.asset(
              'lib/app/modules/onboard_module/assets/logo_2.svg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      // const SizedBox(height: 100),
      Expanded(
        flex: 1,
        child: Container(
          // alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Fast',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
              Row(
                children: [
                  Text('Everything in single click', style: TextStyle()),
                ],
              ),
              Row(
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
          ),
        ),
      ),
    ],
  );
}
