import 'package:get/get.dart';

import '../controller/home_work_detail_screen_controller.dart';

class HomeWorkDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeWorkDetailScreenController());
  }
}