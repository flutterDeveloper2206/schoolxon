import 'package:get/get.dart';
import 'package:schoolxon/presentation/leave_details_screen/controller/leave_details_screen_controller.dart';


class LeaveDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaveDetailsScreenController());
  }
}
