import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolxon/core/utils/image_constant.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
import 'package:schoolxon/core/utils/string_constant.dart';
import 'package:schoolxon/widgets/custom_image_view.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../widgets/custom_elavated_button.dart';
import 'controller/onboarding_screen_controller.dart';
import 'onBoardingContant_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  var onBoardingController = Get.find<OnBoardingScreenController>();

  List<Map<String, String>> onBoardingData = [
    {"image": ImageConstant.imgOnboarding1},
    {"image": ImageConstant.imgOnboarding2},
    {"image": ImageConstant.imgOnboarding3},
  ];

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          onBoardingController.pageController.animateToPage(
              onBoardingController.currentPage.value - 1,
              duration: Duration(milliseconds: 250),
              curve: Curves.easeIn);
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          onBoardingController.pageController.animateToPage(
              onBoardingController.currentPage.value + 1,
              duration: Duration(milliseconds: 250),
              curve: Curves.easeIn);
        }
      },
      child: Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16, top: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      onBoardingController.skipTap();
                    },
                    child: Text(AppString.skip,
                        style:
                            PMT.appStyle(14, fontColor: ColorConstant.blueF9)),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (value) {
                        onBoardingController.currentPage.value = value;
                        print(onBoardingController.currentPage.value);
                      },
                      controller: onBoardingController.pageController,
                      itemCount: onBoardingData.length,
                      itemBuilder: (context, index) => OnBoardingContent(
                        image: onBoardingData[index]["image"],
                      ),
                    ),
                    Positioned(
                        top: 220,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgOnboarding4,
                        )),
                    Positioned(
                      bottom: 30,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          onBoardingController.currentPage.value == 1
                              ? "walkthrough 2"
                              : onBoardingController.currentPage.value == 2
                                  ? "walkthrough 3"
                                  : "walkthrough 1",
                          style: PMT.style(0).copyWith(
                              color: ColorConstant.primaryBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(18)),
                        ),
                      ),
                      SizedBox(height: getHeight(10)),
                      Obx(
                        () => Text(
                          onBoardingController.currentPage.value == 1
                              ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's "
                              : onBoardingController.currentPage.value == 2
                                  ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's "
                                  : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
                          textAlign: TextAlign.center,
                          style: PMT.style(0).copyWith(
                              color: ColorConstant.black72,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(15)),
                        ),
                      ),
                      SizedBox(height: getHeight(50)),
                      Obx(
                        () => AppElevatedButton(
                          buttonShadowColor: Colors.transparent,
                          buttonName:
                              onBoardingController.currentPage.value == 2
                                  ? "Get Started"
                                  : "Next",
                          textColor: Colors.white,
                          buttonColor: ColorConstant.blueF9,
                          onPressed: () {
                            if (onBoardingController.currentPage.value == 0) {
                              onBoardingController.currentPage.value = 1;
                              onBoardingController.pageController.nextPage(
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeIn);
                            } else if (onBoardingController.currentPage.value ==
                                1) {
                              onBoardingController.currentPage.value = 2;
                              onBoardingController.pageController.nextPage(
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeIn);
                            } else if (onBoardingController.currentPage.value ==
                                2) {
                              onBoardingController.onTapOfGetStartedButton();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Obx buildDot({int? index}) {
    return Obx(
      () => onBoardingController.currentPage.value == index
          ? Container(
              margin: EdgeInsets.only(right: 5),
              height: getHeight(6),
              width: getWidth(25),
              child: Padding(
                padding: EdgeInsets.all(1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.blueF9,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(right: 5),
              height: getHeight(5),
              width: getWidth(5),
              decoration: BoxDecoration(
                color: ColorConstant.blueFC,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
    );
  }
}
