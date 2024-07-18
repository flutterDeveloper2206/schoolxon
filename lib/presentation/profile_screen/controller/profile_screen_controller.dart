import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:schoolxon/presentation/profile_screen/model/student_model.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/app_date_format.dart';
import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../core/utils/string_constant.dart';
import '../../../routes/app_routes.dart';

class ProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  RxBool hasEdit = true.obs;
  RxString image = ''.obs;
  RxString gender = 'Male'.obs;
  Rx<DateTime> initialDate = DateTime.now().obs;
  RxString selectedDate = 'Tap to select date'.obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> lastController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> currentController = TextEditingController().obs;
  Rx<TextEditingController> permanentController = TextEditingController().obs;
  Rx<TextEditingController> aadhaarController = TextEditingController().obs;

  Rx<StudentDataModel> studentModel = StudentDataModel().obs;
  @override
  void onInit() {
    getStudentApi();
    super.onInit();
  }

  DateTime parseDate(String dateString) {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    return dateFormat.parse(dateString);
  }

  void next() {
    if (nameController.value.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterFirstNamePlease, error: true);
    } else if (lastController.value.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterLastNamePlease, error: true);
    } else if (emailController.value.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterEmailPlease, error: true);
    } else if (mobileController.value.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterMobilePlease, error: true);
    } else if (selectedDate.value.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterDobPlease, error: true);
    } else if (currentController.value.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterCurrentAddressPlease, error: true);
    } else if (permanentController.value.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterPermanentPlease, error: true);
    } else if (aadhaarController.value.text.isEmpty) {
      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.enterAadhaarPlease, error: true);
    } else {
      updateUser();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
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

    if (d != null) {
      selectedDate.value = changeDateFormat(
          d.toString(),
          AppDateFormats.DATE_FORMAT_YYYY_MM_SS_HH_MM_SS,
          AppDateFormats.DATE_FORMAT_DD_MM_YYYY_DES);
      print('object = ${selectedDate.value}');
    }

    // selectedDate.value = new DateFormat.yMMMMd("en_US").format(d);
    print(selectedDate);
  }

  Future<void> updateUser() async {
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);
    isUpdateLoading.value = true;
    // try {
    final headers = {
      'Content-Type': 'application/json',
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('${NetworkUrl.updateProfileUrl}$schoolId/$studentId'));
    request.headers.addAll(headers);

    request.fields['email'] = emailController.value.text;
    request.fields['mobileno'] = mobileController.value.text;
    request.fields['gender'] = gender.value;
    request.fields['dob'] = selectedDate.value;
    request.fields['current_address'] = currentController.value.text;
    request.fields['permanent_address'] = permanentController.value.text;
    request.fields['adhar_no'] = aadhaarController.value.text;

    if (!image.value.contains('https://api.')) {
      request.files.add(
          await http.MultipartFile.fromPath("student_images", image.value));
    }
    // var uri = Uri.parse(
    //     'https://api.aischoolara.com/api/AuthStudent/profileUpdate/705/332');
    // var request = http.MultipartRequest('POST', uri);
    //
    // request.headers['user-agent'] = 'Dart/3.3 (dart:io)';
    // request.headers['content-type'] = 'multipart/form-data';
    // request.headers['accept-encoding'] = 'gzip';
    //
    // request.fields['email'] = 'tauseefa19@gmail.com';
    // request.fields['mobileno'] = '8789391176';
    // request.fields['gender'] = 'Male';
    // request.fields['dob'] = '06-05-1996';
    // request.fields['current_address'] = 'At Dehti Ps Palasi Araria 854333';
    // request.fields['permanent_address'] = 'At Dehti Ps Palasi Araria 854333';
    // request.fields['adhar_no'] = '758741526325';

    // var response = await request.send();
    log('URL===> ${Uri.parse('${NetworkUrl.updateProfileUrl}$schoolId/$studentId')}');
    log('PARAMS===> ${request.fields.toString()}');

    await request.send().then(
      (values) async {
        var responsed = await http.Response.fromStream(values);
        final value = json.decode(responsed.body);

        print('value.runtimeType == String ${value}');
        // print('value.runtimeType == String ${value.statusCode}');
        if (value.runtimeType == String) {
          isUpdateLoading.value = false;
          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (responsed.statusCode == 200) {
            isUpdateLoading.value = false;
            // loginModel.value = LoginModel.fromJson(value.body);
            // await PrefUtils.putObject(PrefsKey.loginModel, loginModel.value);
            // await PrefUtils.setString(PrefsKey.isLogin, '1');
            // bool set = await PrefUtils.setString(
            //     PrefsKey.studentID, loginModel.value.student?.studentId ?? '');
            ProgressDialogUtils.showTitleSnackBar(
                headerText: AppString.profileSuccessfully);
            // Get.toNamed(AppRoutes.languageSelectScreenRout);
          } else {
            isUpdateLoading.value = false;

            ProgressDialogUtils.showTitleSnackBar(
                headerText: AppString.something, error: true);
          }
        }
      },
    );

    // }
    // catch (error) {
    //   isUpdateLoading.value = false;
    //
    //   ProgressDialogUtils.showTitleSnackBar(
    //       headerText: AppString.something, error: true);
    // }
  }

  Future<void> getStudentApi() async {
    String schoolId = await PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = await PrefUtils.getString(PrefsKey.studentID);
    isLoading.value = true;
    try {
      ApiService()
          .callGetApi(
              body: await ApiService().getBlankApiBody(),
              headerWithToken: false,
              showLoader: false,
              url: '${NetworkUrl.getStudentUrl}$schoolId/$studentId')
          .then((value) {
        if (value.statusCode != null && value.statusCode == 200) {
          studentModel.value = StudentDataModel.fromJson(value.body);
          image.value =
              '${NetworkUrl.imageBaseUrl}${studentModel.value.studentInfo?.image ?? ''}';
          gender.value = studentModel.value.studentInfo?.gender ?? '';
          nameController.value.text =
              studentModel.value.studentInfo?.firstname ?? '';
          lastController.value.text =
              studentModel.value.studentInfo?.lastname ?? '';
          emailController.value.text =
              studentModel.value.studentInfo?.email ?? '';
          mobileController.value.text =
              studentModel.value.studentInfo?.mobileno ?? '';
          currentController.value.text =
              studentModel.value.studentInfo?.currentAddress ?? '';
          permanentController.value.text =
              studentModel.value.studentInfo?.permanentAddress ?? '';
          aadhaarController.value.text =
              studentModel.value.studentInfo?.adharNo ?? '';
          selectedDate.value = changeDateFormat(
              studentModel.value.studentInfo?.dob.toString(),
              AppDateFormats.DATE_FORMAT_YYYY_MM_SS_HH_MM_SS,
              AppDateFormats.DATE_FORMAT_DD_MM_YYYY_DES);
          // studentModel.value.studentInfo?.dob.toString() ?? '';
          isLoading.value = false;
        } else {
          isLoading.value = false;
          ProgressDialogUtils.showTitleSnackBar(
              headerText: AppString.something, error: true);
        }
      });
    } catch (error) {
      print('Error fetching schools: $error');
      isLoading.value = false;

      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.something, error: true);
    }
  }
}
