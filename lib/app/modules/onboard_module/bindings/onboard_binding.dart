import 'package:get/get.dart';
import 'package:password_manager/app/modules/onboard_module/controller/onboard_controller.dart';

class OnboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardController());
  }
}
