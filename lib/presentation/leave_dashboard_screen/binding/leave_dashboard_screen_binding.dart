import 'package:get/get.dart';

import '../controller/leave_dashboard_screen_controller.dart';

class LeaveDashBoardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaveDashBoardScreenController());
  }
}
