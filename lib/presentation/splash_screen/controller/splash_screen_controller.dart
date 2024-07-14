import 'dart:async';

import 'package:get/get.dart';
import 'package:schoolxon/core/utils/app_prefs_key.dart';
import 'package:schoolxon/core/utils/pref_utils.dart';

import '../../../routes/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    changeRoute();
    super.onInit();
  }

  Future changeRoute() async {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      String? login = PrefUtils.getString(PrefsKey.isLogin);
      if (login != null && login == '1') {
        Get.offAllNamed(AppRoutes.homeScreenRout);
      } else {
        Get.offAllNamed(AppRoutes.onBoardingScreenRout);
      }
    });
  }
}

// Future<void> callDeleteAccountApi() async {
//   isLoadingDelete.value = true;
//   ApiService()
//       .callGetApi(
//       body: await ApiService().getBlankApiBody(),
//       headerWithToken: true,
//       showLoader: true,
//       url: NetworkUrl.getDeleteAccountUrl)
//       .then((value) {
//     if (value.body != null && value.body["status"] == true) {
//       isLoadingDelete.value = false;
//       PrefUtils().clearPreferencesData();
//       Get.offAllNamed(AppRoutes.welcomeScreenRoute);
//     } else {
//       isLoadingDelete.value = false;
//       ProgressDialogUtils.showSnackBar(
//           bodyText: value.body["message"], headerText: AppString.error);
//     }
//   });
// }
