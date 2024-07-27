import 'package:get/get.dart';

import '../controller/dashboard_screen_controller.dart';

class DashBoardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardScreenController());
  }
}
