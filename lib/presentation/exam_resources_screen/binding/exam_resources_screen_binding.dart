import 'package:get/get.dart';
import 'package:schoolxon/presentation/exam_resources_screen/controller/exam_resources_screen_controller.dart';

class ExamResourcesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExamResourcesScreenController());
  }
}