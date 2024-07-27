import 'package:get/get.dart';

import '../controller/notice_board_screen_controller.dart';

class NoticeBoardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoticeBoardScreenController());
  }
}
