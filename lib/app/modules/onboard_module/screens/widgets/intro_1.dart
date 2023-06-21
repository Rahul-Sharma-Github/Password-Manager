// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget intro_1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        flex: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 10,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xff292D32),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                Container(
                  height: 10,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                Container(
                  height: 10,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: 160,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Container(
            // alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Security',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Control your security',
                      style: GoogleFonts.poppins(
                          fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            maxLines: 5,
                            'This application is build on blockchain so that you can get 100% security across websites & applications with single app.',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
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
    ],
  );
}
