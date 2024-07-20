import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';

class LeaveDetailsScreenController extends GetxController {
  var progress = 0.0.obs;
  final Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  final Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);
  RxBool isUpdateLoading = false.obs;
  Timer? timer;
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void removeImage() {
    timer?.cancel();
    progress.value = 0.0;
    selectedImage.value = null;
  }

  void startProgress() {
    progress.value = 0.0;

    timer = Timer.periodic(Duration(microseconds: 100000), (timer) {
      if (progress.value >= 1) {
        timer.cancel();
      } else {
        progress.value += 0.01;
      }
    });
  }

  Future<void> selectDate(
      BuildContext context, Rx<DateTime?> selectedDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme:
                ColorScheme.light(primary: ColorConstant.blueSecondary),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }

  final ImagePicker _picker = ImagePicker();
  RxInt isSickLeaveSelected = 0.obs;
  var imagePath = ''.obs;
  var selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
      startProgress();
    }
  }

  void selectCasualLeave(int index) {
    isSickLeaveSelected.value = index;
  }

  void next() {
    if (subjectController.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterUserSubject);
    } else if (selectedStartDate.value == null) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.selectStartDate);
    } else if (selectedEndDate.value == null) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.selectEndDate);
    } else if (descriptionController.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterDescription);
    } else if (selectedImage.value == null &&
        selectedImage.value?.path == null) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.selectDocument);
    } else {
      applyLeave();
    }
  }

  Future<void> applyLeave() async {
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);
    isUpdateLoading.value = true;
    try {
      final headers = {
        'Content-Type': 'application/json',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${NetworkUrl.applyLeaveUrl}$schoolId/$studentId'));
      request.headers.addAll(headers);

      request.fields['from_date'] =
          '${selectedStartDate.value!.day}-${selectedStartDate.value!.month}-${selectedStartDate.value!.year}';

      request.fields['to_date'] =
          '${selectedEndDate.value!.day}-${selectedEndDate.value!.month}-${selectedEndDate.value!.year}';
      request.fields['reason'] = descriptionController.text;
      request.fields['subject'] = subjectController.text;

      request.files.add(await http.MultipartFile.fromPath(
          "file", selectedImage.value?.path ?? ''));

      log('URL===> ${Uri.parse('${NetworkUrl.updateProfileUrl}$schoolId/$studentId')}');
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
