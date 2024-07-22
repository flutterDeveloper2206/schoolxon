import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:schoolxon/presentation/attendance/model/attendance_model.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../core/utils/string_constant.dart';

class AttendanceScreenController extends GetxController {
  dynamic argumentData = Get.arguments;

  RxList<AttendanceModel> attendanceModel = <AttendanceModel>[].obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      attendanceModel.value = argumentData[0]['attendanceModel'];
    });
    super.onInit();
  }

  String status(status) {
    switch (status) {
      case "1":
        {
          return 'Present';
        }

      case "2":
        {
          return 'Present';
        }

      case "3":
        {
          return 'Late';
        }

      case "4":
        {
          return 'Absent';
        }
      case "5":
        {
          return 'Holiday';
        }
      case "6":
        {
          return 'Half Day';
        }

      default:
        {
          return 'Absent';
        }
    }
  }
}
