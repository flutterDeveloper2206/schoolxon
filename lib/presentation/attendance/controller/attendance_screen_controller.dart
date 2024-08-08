import 'dart:developer';

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
  List<DateTime> currentWeek = [];
  DateTime now = DateTime.now();
  DateTime currentMonth = DateTime.now();


  DateTime firstDayOfMonth = DateTime.now();
  DateTime lastDayOfMonth = DateTime.now();


  RxBool isLoading = false.obs;
  RxList<AttendanceModel> attendanceModel = <AttendanceModel>[].obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      attendanceModel.value = argumentData[0]['attendanceModel'];
      getAttendanceApi();
    });
    super.onInit();
  }

  Future<void> getAttendanceApi() async {
    isLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    // try {
    await ApiService()
        .callPostApi(
        body: FormData({
          'start_day': firstDayOfMonth,
          'end_day':lastDayOfMonth
        }),
        headerWithToken: false,
        showLoader: true,
        url: '${NetworkUrl.attendanceUrl}${schoolId}/${studentId}')

    // '${NetworkUrl.homeWorkDetailsUrl}${schoolId}/342/${homeWorkId}')
        .then((value) async {
      log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${firstDayOfMonth}');
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
              .toList()
              .reversed
              .toList();
          isLoading.value = false;
        }
        else {
          isLoading.value = false;

          ProgressDialogUtils.showTitleSnackBar(
              headerText: AppString.something, error: true);
          print('==============================================');
        }
      }
    });
    // } catch (error) {
    //   isLoading.value = false;
    //
    //   ProgressDialogUtils.showTitleSnackBar(
    //       headerText: AppString.something, error: true);
    //   print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ${error}');
    // }
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
  void onWeekChange(DateTime firstDay, DateTime lastDay) {
    // Update the first and last day of the selected week
    firstDayOfMonth = firstDay;
    lastDayOfMonth = lastDay;

    // Check if the month has changed
    if (firstDay.month != currentMonth.month || firstDay.year != currentMonth.year) {
      // Update the currentMonth to the new month
      currentMonth = firstDay;

      // Call the API since the month has changed
      getAttendanceApi();
    }
  }
}
