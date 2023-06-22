import 'package:get/get.dart';

import '../controller/registration_controller.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}
