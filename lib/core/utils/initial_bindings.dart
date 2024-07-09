
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:schoolxon/core/network/network_info.dart';
import 'package:schoolxon/core/utils/pref_utils.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    // Get.put(ApiClient());
    Connectivity connectivity = Connectivity();

    Get.put(NetworkInfo(connectivity));
  }
}
