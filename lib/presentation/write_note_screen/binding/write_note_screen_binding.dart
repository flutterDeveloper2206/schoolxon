import 'package:get/get.dart';

import '../controller/write_note_screen_controller.dart';

class WriteNoteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WriteNoteScreenController());
  }
}
