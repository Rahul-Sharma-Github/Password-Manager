import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  // current index for PageView
  var currentIndex = 0.obs;
  // controller for PageView
  var pageController = PageController();
}
