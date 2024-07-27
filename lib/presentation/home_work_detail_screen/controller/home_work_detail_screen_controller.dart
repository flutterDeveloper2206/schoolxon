import 'dart:async';
import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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

  Future<void> downloadDocument() async {
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);
    if (await Permission.storage.request().isGranted) {
      // Get the directory to save the file
      final directory = await getExternalStorageDirectory();
      print('directory.path ${directory?.path}');
      if (directory != null) {
        // Start the download
        final taskId = await FlutterDownloader.enqueue(
          url:
              '${NetworkUrl.homeWorkDownloadUrl}${schoolId}/${studentId}/${homeWorkId}',
          savedDir: directory.path,
          saveInPublicStorage: true,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              true, // click on notification to open downloaded file (for Android)
        );

        print('Download started: $taskId');
      }
    }
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
              url:
                  '${NetworkUrl.homeWorkDetailsUrl}${schoolId}/${studentId}/${homeWorkId}')
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
