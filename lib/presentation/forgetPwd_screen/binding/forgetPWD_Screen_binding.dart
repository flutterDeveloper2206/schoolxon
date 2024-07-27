import 'package:get/get.dart';
import 'package:schoolxon/presentation/forgetPwd_screen/controller/forgetPwd_screen_controller.dart';

class ForgetPwdScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPwdScreenController());
  }
}
