import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:schoolxon/ApiServices/api_service.dart';
import 'package:schoolxon/core/utils/network_url.dart';
import 'package:schoolxon/core/utils/string_constant.dart';
import 'package:schoolxon/presentation/home_screen/model/get_student_by_id_model.dart';

import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<StudentByIdModel> studentModel = StudentByIdModel().obs;

  @override
  onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getStudentApi();
    });
    super.onInit();
  }

  Future<void> getStudentApi() async {
    isLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    try {
      await ApiService()
          .callGetApi(
              body: FormData({}),
              headerWithToken: false,
              showLoader: true,
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
