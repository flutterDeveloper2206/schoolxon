import 'package:get/get.dart';
import 'package:schoolxon/presentation/language_select_screen/controller/language_select_controller.dart';

class LanguageSelectScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageSelectScreenController>(
          () => LanguageSelectScreenController(),
    );
  }
}
