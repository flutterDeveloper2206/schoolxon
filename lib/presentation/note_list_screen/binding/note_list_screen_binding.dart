import 'package:get/get.dart';

import '../controller/note_list_screen_controller.dart';

class NoteListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteListScreenController());
  }
}
