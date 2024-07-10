import 'package:get/get.dart';

import '../controller/account_screen_controller.dart';

class AccountScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountScreenController());
  }
}
