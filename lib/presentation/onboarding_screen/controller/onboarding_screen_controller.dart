import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class OnBoardingScreenController extends GetxController {
  var currentPage = 0.obs;
  late PageController pageController;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void skipTap() {
    currentPage.value = 3;
    pageController.jumpToPage(currentPage.value);
  }

  void onTapOfGetStartedButton() {
    Get.offAllNamed(AppRoutes.loginScreenRout);
  }
}
