import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/time_table_screen_controller.dart';

class TimeTableScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimeTableScreenController());
  }
}