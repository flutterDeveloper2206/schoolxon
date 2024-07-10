import 'package:get/get.dart';

import '../controller/contact_support_screen_controller.dart';

class ContactSupportScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactSupportScreenController());
  }
}
