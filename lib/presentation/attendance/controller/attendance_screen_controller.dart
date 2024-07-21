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
  RxBool isLoading = false.obs;
  RxList<AttendanceModel> attendanceModel = <AttendanceModel>[].obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAttendanceApi();
    });
    super.onInit();
  }

  Future<void> getAttendanceApi() async {
    isLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    try {
      await ApiService()
          .callGetApi(
              body: FormData({}),
              headerWithToken: false,
              showLoader: true,
              url: '${NetworkUrl.attendanceUrl}${schoolId}/${studentId}')
          // '${NetworkUrl.homeWorkDetailsUrl}${schoolId}/342/${homeWorkId}')
          .then((value) async {
        print('value.runtimeType == String ${value}');
        print('value.runtimeType == String ${value.statusCode}');
        if (value.runtimeType == String) {
          isLoading.value = false;
          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (value.statusCode == 200) {
            attendanceModel.value = (value.body as List)
                .map((data) => AttendanceModel.fromJson(data))
                .toList();
            isLoading.value = false;
          } else {
            isLoading.value = false;

            ProgressDialogUtils.showTitleSnackBar(
                headerText: AppString.something, error: true);
            print('==============================================');
          }
        }
      });
    } catch (error) {
      isLoading.value = false;

      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.something, error: true);
      print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
    }
  }
}
