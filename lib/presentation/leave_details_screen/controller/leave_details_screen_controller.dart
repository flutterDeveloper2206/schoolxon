import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../model/leave_details_model.dart';

class LeaveDetailsScreenController extends GetxController {
  dynamic argumentData = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isRemoveLoading = false.obs;
  RxString leaveID = ''.obs;
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;
  Rx<TextEditingController> subjectController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<LeaveDetailsModel> leaveDetailsModel = LeaveDetailsModel().obs;

  @override
  void onInit() {
    leaveID.value = argumentData[0]['leaveId'];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getLeaveDetailsApi();
    });
    super.onInit();
  }

  Future<void> getLeaveDetailsApi() async {
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
                  '${NetworkUrl.leaveDetailsUrl}${schoolId}/${studentId}/${leaveID.value}')
          // url: '${NetworkUrl.leaveDetailsUrl}${schoolId}/$studentId')
          .then((value) async {
        print('value.runtimeType == String ${value}');
        print('value.runtimeType == String ${value.statusCode}');
        if (value.runtimeType == String) {
          isLoading.value = false;

          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (value.statusCode == 200) {
            isRemoveLoading.value = false;

            leaveDetailsModel.value = LeaveDetailsModel.fromJson(value.body);
            subjectController.value.text =
                leaveDetailsModel.value.subject ?? '';
            descriptionController.value.text =
                leaveDetailsModel.value.reason ?? '';
            startDate.value = leaveDetailsModel.value.fromDate ?? '';
            endDate.value = leaveDetailsModel.value.toDate ?? '';
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
              '${NetworkUrl.leaveDownloadUrl}${schoolId}/${studentId}/${leaveID.value}',
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

  Future<void> getLeaveRemoveApi() async {
    isRemoveLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    try {
      await ApiService()
          .callGetApi(
              body: FormData({}),
              headerWithToken: false,
              showLoader: false,
              // url: '${NetworkUrl.removeLeaveUrl}722/2630/4')
              url:
                  '${NetworkUrl.removeLeaveUrl}${schoolId}/$studentId/${leaveID.value}')
          .then((value) async {
        print('value.runtimeType == String ${value.body}');
        print('value.runtimeType == String ${value.statusCode}');
        if (value.runtimeType == String) {
          isRemoveLoading.value = false;

          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (value.statusCode == 200) {
            if (value.body['status'] == 'success') {
              isRemoveLoading.value = false;
              Get.back();
              ProgressDialogUtils.showTitleSnackBar(
                  headerText: value.body['message']);
            } else {
              isRemoveLoading.value = false;
              ProgressDialogUtils.showTitleSnackBar(
                  headerText: AppString.something);
            }
          } else {
            isRemoveLoading.value = false;

            ProgressDialogUtils.showTitleSnackBar(
                headerText: AppString.something, error: true);
          }
        }
      });
    } catch (error) {
      isRemoveLoading.value = false;

      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.something, error: true);
    }
  }
}
