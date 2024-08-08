import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:schoolxon/ApiServices/api_service.dart';
import 'package:schoolxon/core/utils/network_url.dart';
import 'package:schoolxon/core/utils/string_constant.dart';
import 'package:schoolxon/presentation/attendance/controller/attendance_screen_controller.dart';
import 'package:schoolxon/presentation/home_screen/model/get_student_by_id_model.dart';

import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../attendance/model/attendance_model.dart';

class HomeScreenController extends GetxController {
  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime lastDayOfMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
  RxBool isLoading = false.obs;
  Rx<StudentByIdModel> studentModel = StudentByIdModel().obs;
  RxList<AttendanceModel> attendanceModel = <AttendanceModel>[].obs;

  @override
  onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getStudentApi(true);
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
        } else {
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

  Future<void> getStudentApi(bool loading) async {
    isLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    try {
      await ApiService()
          .callGetApi(
              body: FormData({

              }),
              headerWithToken: false,
              showLoader: loading,
              url: '${NetworkUrl.getStudentByIdUrl}${schoolId}/$studentId')
          .then((value) async {
        print('value.runtimeType == String ${value}');
        print('value.runtimeType == String ${value.statusCode}');
        if (value.runtimeType == String) {
          isLoading.value = false;

          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (value.statusCode == 200) {
            isLoading.value = false;
            studentModel.value = StudentByIdModel.fromJson(value.body);
            PrefUtils.setString(PrefsKey.studentName,
                '${studentModel.value.studentInfo?.firstname ?? ''} ${studentModel.value.studentInfo?.middlename ?? ''}');
          } else {
            isLoading.value = false;

            ProgressDialogUtils.showTitleSnackBar(
                headerText: AppString.something, error: true);
          }
        }
      });
    } catch (error) {
      isLoading.value = false;

      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.something, error: true);
    }
  }
}
