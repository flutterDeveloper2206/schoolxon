import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/pdf_screen_controller.dart';

class PDFScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PDFScreenController());
  }
}