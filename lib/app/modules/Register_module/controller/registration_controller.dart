import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegistrationController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  var currentSelectedTabValue = 0.obs;
}
