import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:schoolxon/core/utils/image_constant.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
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
          body: Column(
            children: [
              SizedBox(
                height: getHeight(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: (16), top: (20)),
                    child: InkWell(
                      onTap: () {
                        onBoardingController.onTapOfGetStartedButton();
                      },
                      child: Text(
                        "skip",
                        style: PMT.style(0).copyWith(
                            color: ColorConstant.blueFC,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(18)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Expanded(
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
                        top: 60,
                        child: Image.asset(ImageConstant.imgOnboarding4)),
                    Positioned(
                      bottom: 20,
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
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: (20), right: (20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: getHeight(80),
                            ),
                            Obx(
                              () => Text(
                                onBoardingController.currentPage.value == 1
                                    ? "walkthrough 1"
                                    : onBoardingController.currentPage.value ==
                                            2
                                        ? "walkthrough 2"
                                        : "walkthrough 3",
                                style: PMT.style(0).copyWith(
                                    color: ColorConstant.black72,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(18)),
                              ),
                            ),
                            SizedBox(
                              height: getHeight(40),
                            ),
                            Obx(
                              () => Text(
                                onBoardingController.currentPage.value == 1
                                    ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's "
                                    : onBoardingController.currentPage.value ==
                                            2
                                        ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's "
                                        : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
                                textAlign: TextAlign.center,
                                style: PMT.style(0).copyWith(
                                    color: ColorConstant.black72,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(16)),
                              ),
                            ),
                            Spacer(),
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
                                  if (onBoardingController.currentPage.value ==
                                      0) {
                                    onBoardingController.currentPage.value = 1;
                                    onBoardingController.pageController
                                        .nextPage(
                                            duration:
                                                Duration(milliseconds: 250),
                                            curve: Curves.easeIn);
                                  } else if (onBoardingController
                                          .currentPage.value ==
                                      1) {
                                    onBoardingController.currentPage.value = 2;
                                    onBoardingController.pageController
                                        .nextPage(
                                            duration:
                                                Duration(milliseconds: 250),
                                            curve: Curves.easeIn);
                                  } else if (onBoardingController
                                          .currentPage.value ==
                                      2) {
                                    onBoardingController
                                        .onTapOfGetStartedButton();
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
            ],
          )),
    );
  }

  Obx buildDot({int? index}) {
    return Obx(
      () => onBoardingController.currentPage.value == index
          ? Container(
              margin: EdgeInsets.only(right: 5),
              height: getHeight(8),
              width: getWidth(40),
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
              height: getHeight(8),
              width: getWidth(8),
              decoration: BoxDecoration(
                color: ColorConstant.blueFC,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
    );
  }
}
