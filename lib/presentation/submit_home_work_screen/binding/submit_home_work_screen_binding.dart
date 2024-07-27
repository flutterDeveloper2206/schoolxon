import 'package:get/get.dart';

import '../controller/submit_home_work_screen_controller.dart';

class SubmitHomeWorkScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubmitHomeWorkScreenController());
  }
}