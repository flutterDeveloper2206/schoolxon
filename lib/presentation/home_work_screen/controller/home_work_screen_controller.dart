import 'package:get/get.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../core/utils/string_constant.dart';
import '../model/homework_list_model.dart';

class HomeWorkScreenController extends GetxController {
  List subject = ['English', 'Maths', 'Science', 'Social Science'];
  RxBool isLoading = false.obs;
  Rx<HomeWorkListModel> homeWorkModelList = HomeWorkListModel().obs;

  @override
  onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getHomeWorkListApi();
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
}
