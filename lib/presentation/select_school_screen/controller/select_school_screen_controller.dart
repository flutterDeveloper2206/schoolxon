import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/app_prefs_key.dart';
import 'package:schoolxon/core/utils/pref_utils.dart';
import 'package:schoolxon/widgets/custom_snackbar.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../routes/app_routes.dart';
import '../school_model.dart';

class SelectSchoolScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt selectedIndex = 0.obs;
  TextEditingController controller = TextEditingController();
  Rx<SchoolModel> selectedSchool = SchoolModel().obs;
  RxList<SchoolModel> allSchool = <SchoolModel>[].obs;
  RxList<SchoolModel> filterSchool = <SchoolModel>[].obs;
  @override
  void onInit() {
    callDeleteAccountApi();
    super.onInit();
  }

  void selectItem(SchoolModel item) {
    selectedSchool.value = item;
  }

  Future<void> next() async {
    if (selectedIndex.value != 0) {
      await PrefUtils.putObject(PrefsKey.schoolModel, selectedSchool.value);
      await PrefUtils.setString(
          PrefsKey.selectSchoolId, selectedSchool.value.id ?? '');
      Get.toNamed(AppRoutes.loginScreenRout);
    } else {
      CustomSnackBar.showTitleSnackBar(headerText: AppString.selectSchool);
    }
  }

  void filterItems(String query) {
    List<SchoolModel> _results = [];
    if (query.isEmpty) {
      _results = allSchool;
    } else {
      _results = allSchool
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    filterSchool.value = _results;
  }

  Future<void> callDeleteAccountApi() async {
    isLoading.value = true;
    try {
      ApiService()
          .callGetApi(
              body: await ApiService().getBlankApiBody(),
              headerWithToken: false,
              showLoader: false,
              url: NetworkUrl.getSchoolUrl)
          .then((value) {
        if (value.statusCode != null && value.statusCode == 200) {
          List<SchoolModel> schoolList = (value.body as List)
              .map((data) => SchoolModel.fromJson(data))
              .toList();
          allSchool.value = schoolList;
          filterSchool.value = allSchool;
          isLoading.value = false;
        } else {
          isLoading.value = false;
          ProgressDialogUtils.showSnackBar(
              bodyText: AppString.something, headerText: AppString.error);
        }
      });
    } catch (error) {
      print('Error fetching schools: $error');
      isLoading.value = false;

      ProgressDialogUtils.showSnackBar(
          bodyText: AppString.something, headerText: AppString.error);
    }
  }
}

// Future<void> callUpdateShowMeOnPetMeetApi({required int isOn}) async {
//   await ApiService()
//       .callPostApi(
//       body: FormData({'show_me_on_petmeet': isOn}),
//       headerWithToken: true,
//       showLoader: true,
//       url: NetworkUrl.updateShowMeOnPetMeet)
//       .then((value) {
//     if (value != null && value["status"] == true) {
//       PrefUtils.setInt(AppString.SHOWMEONPETMEET, isOn);
//
//       ProgressDialogUtils.showSnackBar(
//           bodyText: value["message"], headerText: "SUCCESS");
//     } else {
//       ProgressDialogUtils.showSnackBar(
//           bodyText: value["message"], headerText: AppString.error);
//     }
//   });
// }
