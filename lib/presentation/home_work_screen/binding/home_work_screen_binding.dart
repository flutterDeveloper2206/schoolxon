import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/home_work_screen_controller.dart';

class HomeWorkScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeWorkScreenController());
  }
}