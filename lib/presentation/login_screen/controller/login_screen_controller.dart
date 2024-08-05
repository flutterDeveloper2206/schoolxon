import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:schoolxon/core/utils/app_prefs_key.dart';
import 'package:schoolxon/core/utils/pref_utils.dart';
import 'package:schoolxon/core/utils/string_constant.dart';
import 'package:schoolxon/presentation/login_screen/model/login_model.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/custom_snackbar.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/utils/common_constant.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/progress_dialog_utils.dart';

class LoginScreenController extends GetxController {
  RxBool isCorrect = false.obs;
  RxBool passwordShow = true.obs;
  RxBool isLoading = false.obs;
  Rx<LoginModel> loginModel = LoginModel().obs;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void submit() {
    if (userController.text.isEmpty) {
      CustomSnackBar.showTitleSnackBar(headerText: AppString.enterUserName);
    } else if (passwordController.text.isEmpty) {
      CustomSnackBar.showTitleSnackBar(headerText: AppString.enterPassword);
    } else {
      loginApi();
    }
  }

  Future<void> loginApi() async {
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    isLoading.value = true;

    try {
      await ApiService()
          .callPostApi(
              body: FormData({
                'username': userController.text,
                'password': passwordController.text
              }),
              headerWithToken: false,
              showLoader: false,
              url: '${NetworkUrl.loginUrl}${schoolId}')
          .then((value) async {
        print('value.runtimeType == String ${value}');
        print('value.runtimeType == String ${value.statusCode}');
        if (value.runtimeType == String) {
          isLoading.value = false;

          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (value.statusCode == 200) {
            fcmTokenApi();
            isLoading.value = false;
            loginModel.value = LoginModel.fromJson(value.body);
            await PrefUtils.putObject(PrefsKey.loginModel, loginModel.value);
            await PrefUtils.setString(PrefsKey.isLogin, '1');
            bool set = await PrefUtils.setString(
                PrefsKey.studentID, loginModel.value.student?.studentId ?? '');

            ProgressDialogUtils.showTitleSnackBar(
                headerText: AppString.loginSuccessfully);
            Get.toNamed(AppRoutes.languageSelectScreenRout);
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
  Future<void> fcmTokenApi() async {
    isLoading.value = true;

    try {
      await ApiService()
          .callPostApi(
              body: FormData({
                'app_key': CommonConstant.instance.getFcmToken(),
              }),
              headerWithToken: false,
              showLoader: false,
              url: '${NetworkUrl.fcmTokenUrl}705/342/')
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
