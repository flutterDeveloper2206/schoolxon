import 'package:get/get.dart';

import '../controller/note_show_screen_controller.dart';

class NoteShowScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteShowScreenController());
  }
}
