import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:schoolxon/presentation/home_work_screen/model/subject_model.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../core/utils/string_constant.dart';
import '../model/homework_list_model.dart';

class HomeWorkScreenController extends GetxController {
  var selectedIndex = 0.obs;
  RxString selectSubjectID = '0'.obs;
  Rx<DateTime> selectDate = DateTime.now().obs;
  RxBool isLoading = false.obs;
  Rx<HomeWorkListModel> homeWorkModelList = HomeWorkListModel().obs;
  Rx<SubjectModel> subjectModel = SubjectModel().obs;
  RxList<Subject> subjectsList = <Subject>[].obs;
  RxList<Homeworklist> allHomeWorkList = <Homeworklist>[].obs;
  RxList<Homeworklist> getHomeWorkList = <Homeworklist>[].obs;

  @override
  onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getHomeWorkListApi();
      getSubjectApi();
    });
    super.onInit();
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
              url: '${NetworkUrl.showAllHomeWorkUrl}${schoolId}/${studentId}')
          // url: '${NetworkUrl.getStudentByIdUrl}${schoolId}/$studentId')
          .then((value) async {
        if (value.runtimeType == String) {
          isLoading.value = false;

          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (value.statusCode == 200) {
            isLoading.value = false;
            homeWorkModelList.value = HomeWorkListModel.fromJson(value.body);
            allHomeWorkList.value = homeWorkModelList.value.homeworklist ?? [];
            getHomeWorkList.value = homeWorkModelList.value.homeworklist ?? [];
            print('value.runtimeType == String ${homeWorkModelList.value}');
            print(
                'value.runtimeType == String ${homeWorkModelList.value.homeworklist}');
            update();
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

  Future<void> getSubjectApi() async {
    isLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    try {
      await ApiService()
          .callGetApi(
              body: FormData({}),
              headerWithToken: false,
              showLoader: true,
              url: '${NetworkUrl.subjectUrl}${schoolId}/${studentId}')
          // url: '${NetworkUrl.getStudentByIdUrl}${schoolId}/$studentId')
          .then((value) async {
        if (value.runtimeType == String) {
          isLoading.value = false;

          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (value.statusCode == 200) {
            isLoading.value = false;
            subjectModel.value = SubjectModel.fromJson(value.body);
            subjectsList.value = subjectModel.value.subjects ?? [];
            subjectsList.value.insert(0, Subject(name: 'All', subjectId: '0'));
            print('value.runtimeType == String ${homeWorkModelList.value}');
            print(
                'value.runtimeType == String ${homeWorkModelList.value.homeworklist}');
            update();
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

  String checkGender(String gender) {
    if (gender == 'Male') {
      return 'Mr';
    } else {
      return 'Miss';
    }
  }

  String formatRelativeTimeOrDate(DateTime pastDate) {
    DateTime now = DateTime.now();

    Duration difference = now.difference(pastDate);
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime tomorrow = today.add(Duration(days: 1));
    DateTime yesterday = today.subtract(Duration(days: 1));

    if (pastDate.isAfter(today) && pastDate.isBefore(tomorrow)) {
      return 'today';
    } else if (pastDate.isAfter(tomorrow.subtract(Duration(seconds: 1))) &&
        pastDate.isBefore(tomorrow.add(Duration(days: 1)))) {
      return 'tomorrow';
    } else if (difference.inDays == 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays > 0 && difference.inDays < 2) {
      return 'yesterday';
    } else {
      return DateFormat('EEE,dd MMM yyyy').format(pastDate);
    }
  }
}
