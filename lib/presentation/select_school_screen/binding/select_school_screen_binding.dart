import 'package:get/get.dart';

import '../controller/select_school_screen_controller.dart';

class SelectSchoolScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectSchoolScreenController());
  }
}
