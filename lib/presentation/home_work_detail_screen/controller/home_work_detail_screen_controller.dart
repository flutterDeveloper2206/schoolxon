import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schoolxon/ApiServices/api_service.dart';
import 'package:schoolxon/core/utils/app_prefs_key.dart';
import 'package:schoolxon/core/utils/network_url.dart';
import 'package:schoolxon/core/utils/pref_utils.dart';
import 'package:schoolxon/core/utils/progress_dialog_utils.dart';
import 'package:schoolxon/presentation/home_work_detail_screen/model/home_work_details_model.dart';

import '../../../core/app_export.dart';

class HomeWorkDetailScreenController extends GetxController {
  dynamic argumentData = Get.arguments;
  String homeWorkId = '';
  RxBool isLoading = false.obs;
  Rx<HomeWorkDetailsModel> homeWorkDetailsModel = HomeWorkDetailsModel().obs;
  @override
  void onInit() {
    homeWorkId = argumentData[0]['homeWorkID'];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getHomeWorkListApi();
    });
    startProgress();
    super.onInit();
  }

  final ImagePicker _picker = ImagePicker();
  var progress = 0.0.obs;

  Future<void> openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the selected image
    }
  }

  Future<void> openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the selected image
    }
  }

  void startProgress() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (progress.value >= 1) {
        timer.cancel();
      } else {
        progress.value += 0.01;
      }
    });
  }

  Future<void> getHomeWorkListApi() async {
    isLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    try {
      await ApiService()
          .callGetApi(
              body: FormData({}),
              headerWithToken: false,
              showLoader: true,
              url: '${NetworkUrl.homeWorkDetailsUrl}${schoolId}/342/172')
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
            isLoading.value = false;
            homeWorkDetailsModel.value =
                HomeWorkDetailsModel.fromJson(value.body);
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
