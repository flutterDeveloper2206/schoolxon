import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../home_work_detail_screen/model/home_work_details_model.dart';

class SubmitHomeWorkScreenController extends GetxController {
  TextEditingController descriptionController = TextEditingController();
  var progress = 0.0.obs;
  var imageFile = Rx<XFile?>(null);
  RxBool isUpdateLoading = false.obs;
  Timer? timer;
  String homeWorkId = '';
  RxBool isLoading = false.obs;
  Rx<HomeWorkDetailsModel> homeWorkDetailsModel = HomeWorkDetailsModel().obs;
  @override
  void onInit() {

    super.onInit();
  }

  final ImagePicker _picker = ImagePicker();
  var isSickLeaveSelected = true.obs;
  var imagePath = ''.obs;
  var selectedImage = Rx<File?>(null);


  void removeImage() {
    timer?.cancel();
    progress.value = 0.0;
    selectedImage.value = null;

  }
  void startProgress() {
    progress.value = 0.0;

    timer=  Timer.periodic(Duration(microseconds: 100000), (timer) {
      if (progress.value >= 1) {
        timer.cancel();
      } else {
        progress.value += 0.01;
      }
    });
  }
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);

      startProgress();
    }
  }


  void submit() {
  if (descriptionController.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterDescription);
    } else if (selectedImage.value == null &&
        selectedImage.value?.path == null) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.selectDocument);
    }
  else {
      submitHomeWork();
    }
  }



  Future<void> submitHomeWork() async {
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);
    isUpdateLoading.value = true;
    try {
      final headers = {
        'Content-Type': 'application/json',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${NetworkUrl.submitHomeworkUrl}$schoolId'));
      request.headers.addAll(headers);

      request.fields['student_id'] =
      '342';

      request.fields['homework_id'] =
      '172';
      request.fields['message'] = descriptionController.text;
      request.files.add(await http.MultipartFile.fromPath(
          "file", selectedImage.value?.path ?? ''));

      log('URL===> ${Uri.parse('${NetworkUrl.submitHomeworkUrl}$schoolId')}');
      log('PARAMS===> ${request.fields.toString()}');

      await request.send().then(
            (values) async {
          var responsed = await http.Response.fromStream(values);
          final value = json.decode(responsed.body);

          print('value.runtimeType == String ${value} ${responsed.statusCode}');
          // print('value.runtimeType == String ${value.statusCode}');
          if (value.runtimeType == String) {
            isUpdateLoading.value = false;
            ProgressDialogUtils.showTitleSnackBar(
                headerText: value.toString(), error: true);
          } else {
            if (responsed.statusCode == 200) {
              if (value['status'] == 'success') {
                isUpdateLoading.value = false;
                Get.back();
                ProgressDialogUtils.showTitleSnackBar(
                    headerText: AppString.profileSuccessfully);
              } else {
                isUpdateLoading.value = false;
                ProgressDialogUtils.showTitleSnackBar(
                    headerText: AppString.something);
              }
            } else {
              isUpdateLoading.value = false;

              ProgressDialogUtils.showTitleSnackBar(
                  headerText: AppString.something, error: true);
            }
          }
        },
      );
    } catch (error) {
      isUpdateLoading.value = false;

      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.something, error: true);
    }
  }

}