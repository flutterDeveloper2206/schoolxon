import 'package:get/get.dart';

import '../controller/not_book_subject_screen_controller.dart';

class NoteBookSubjectScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteBookSubjectScreenController());
  }
}
