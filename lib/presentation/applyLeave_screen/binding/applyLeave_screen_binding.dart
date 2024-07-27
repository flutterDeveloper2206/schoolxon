import 'package:get/get.dart';

import '../controller/applyLeave_screen_controller.dart';

class ApplyLeaveScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplyLeaveScreenController());
  }
}
