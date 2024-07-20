import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:schoolxon/ApiServices/api_service.dart';
import 'package:schoolxon/core/utils/app_prefs_key.dart';
import 'package:schoolxon/core/utils/network_url.dart';
import 'package:schoolxon/core/utils/pref_utils.dart';
import 'package:schoolxon/core/utils/progress_dialog_utils.dart';
import 'package:schoolxon/core/utils/string_constant.dart';
import 'package:schoolxon/presentation/leave_dashboard_screen/model/all_leave_model.dart';
import 'package:schoolxon/presentation/login_screen/model/login_model.dart';

import '../../../core/app_export.dart';

class LeaveDashBoardScreenController extends GetxController {
  Rx<LoginModel> loginData = LoginModel().obs;
  RxBool isLoading = false.obs;
  Rx<AllLeaveModel> allLeaveList = AllLeaveModel().obs;
  RxDouble currentLeaves = 4.0.obs; // Initial number of leaves taken
  RxDouble totalLeaves = 12.0.obs; // Total available leaves

  final List<Leave> leaveHistory = [
    Leave(
        type: 'Medical Appointments', date: 'Wed, 16 Dec', status: 'Approved'),
    Leave(
        type: 'Medical Appointments', date: 'Wed, 17 Dec', status: 'Rejected'),
  ];
  @override
  void onInit() {
    getLoginData();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAllLeaveApi();
    });
    super.onInit();
  }

  Future<void> getLoginData() async {
    loginData.value = (await PrefUtils.getLoginModelData(PrefsKey.loginModel))!;
  }

  Future<void> getAllLeaveApi() async {
    isLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    try {
      await ApiService()
          .callGetApi(
              body: FormData({}),
              headerWithToken: false,
              showLoader: true,
              url: '${NetworkUrl.allLeaveGetUrl}${schoolId}/722/2630')
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
            allLeaveList.value = AllLeaveModel.fromJson(value.body);
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

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
}

class Leave {
  final String type;
  final String date;
  final String status;

  Leave({required this.type, required this.date, required this.status});
}
