import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/image_constant.dart';
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
  List<Map<String, String>> onBoardingData = [
    {"image": ImageConstant.imgOnboarding1},
    {"image": ImageConstant.imgOnboarding2},
    {"image": ImageConstant.imgOnboarding3},
  ];

  void skipTap() {
    currentPage.value = 3;
    pageController.jumpToPage(currentPage.value);
  }

  void onTapOfGetStartedButton() {
    Get.offAllNamed(AppRoutes.selectSchoolScreenRout);
  }
}
