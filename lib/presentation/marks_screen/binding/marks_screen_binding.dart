import 'package:get/get.dart';

import '../controller/marks_screen_controller.dart';

class MarksScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarksScreenController());
  }
}