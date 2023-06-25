import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var appBarTitle = 'Home'.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (selectedIndex.value) {
      case 0:
        appBarTitle.value = 'Home';
        break;
      case 1:
        appBarTitle.value = 'Security';
        break;
      case 2:
        appBarTitle.value = 'Search';
        break;
      case 3:
        appBarTitle.value = 'Setting';
        break;
      default:
        appBarTitle.value = 'Home';
    }
  }

  var isSyncSwitchOn = true.obs;

  void syncSwitchOnOff() {
    if (isSyncSwitchOn.value == true) {
      isSyncSwitchOn.value = false;
    } else {
      isSyncSwitchOn.value = true;
    }
  }

  var isAutofillSwitchOn = true.obs;

  void autofillSwitchOnOff() {
    if (isAutofillSwitchOn.value == true) {
      isAutofillSwitchOn.value = false;
    } else {
      isAutofillSwitchOn.value = true;
    }
  }
}
