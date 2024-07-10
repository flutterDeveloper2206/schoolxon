import 'package:get/get.dart';

import '../controller/attendance_screen_controller.dart';

class AttendanceScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceScreenController());
  }
}
