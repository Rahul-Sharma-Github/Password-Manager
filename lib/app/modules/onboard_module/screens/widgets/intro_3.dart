// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget intro_3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Expanded(
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
                    color: const Color(0xff292D32),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                Container(
                  height: 10,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xff292D32),
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
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: SvgPicture.asset(
                  'lib/app/modules/onboard_module/assets/logo_3.svg',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Passblock',
                          style: GoogleFonts.poppins(
                            fontSize: 49,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff292D32),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Frictionless Security',
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            color: const Color(0xff292D32),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
