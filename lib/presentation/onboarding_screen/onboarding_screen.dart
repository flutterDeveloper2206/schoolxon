import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class OnBoardingScreen extends GetWidget<OnBoardingScreenController> {
  var onBoardingController = Get.find<OnBoardingScreenController>();

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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.yellow39,
          body: Obx(
            () => Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorConstant.yellow39,
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      image:
                          AssetImage(onBoardingController.currentPage.value == 0
                              ? ImageConstant.backGround
                              : onBoardingController.currentPage.value == 1
                                  ? ImageConstant.backGround1
                                  : ImageConstant.backGround2),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  ///skip button
                  /* Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        onBoardingController.skipTap();
                      },
                      child: Text(AppString.skip,
                          style:
                              PMT.appStyle(14, fontColor: ColorConstant.blueF9)),
                    ),
                  ),*/
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
                          itemCount: controller.onBoardingData.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 369),
                            child: OnBoardingContent(
                              image: controller.onBoardingData[index]["image"],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          left: 10,
                          right: 10,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  controller.onBoardingData.length,
                                  (index) => buildDot(index: index),
                                ),
                              ),
                              SizedBox(
                                height: getHeight(30),
                              ),
                              Obx(
                                () => Text(
                                  onBoardingController.currentPage.value == 1
                                      ? "Vamos  embarcar\n    nesta jornada\n          juntos"
                                      : onBoardingController
                                                  .currentPage.value ==
                                              2
                                          ? "Vamos  embarcar\n    nesta jornada\n          juntos"
                                          : "Vamos  embarcar\n    nesta jornada\n          juntos",
                                  style: PMT.style(0).copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w900,
                                      fontSize: getFontSize(18)),
                                ),
                              ),
                              SizedBox(
                                height: getHeight(5),
                              ),
                              Obx(
                                () => Text(
                                  onBoardingController.currentPage.value == 1
                                      ? "Vamos comecar a jornada rumo\nao conhecimento solidpo"
                                      : onBoardingController
                                                  .currentPage.value ==
                                              2
                                          ? "Vamos comecar a jornada rumo\nao conhecimento solidpo "
                                          : "Vamos comecar a jornada rumo\nao conhecimento solidpo",
                                  textAlign: TextAlign.center,
                                  style: PMT.style(0).copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w200,
                                      fontSize: getFontSize(10)),
                                ),
                              ),
                              SizedBox(
                                height: getHeight(15),
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.only(
                                      right: 60, left: 60, top: 50),
                                  child: AppElevatedButton(
                                    buttonShadowColor: Colors.transparent,
                                    buttonName: onBoardingController
                                                .currentPage.value ==
                                            2
                                        ? AppString.getStarted
                                        : AppString.next,
                                    textColor: Colors.white,
                                    buttonColor: ColorConstant.greyColor78,
                                    onPressed: () {
                                      if (onBoardingController
                                              .currentPage.value ==
                                          0) {
                                        onBoardingController.currentPage.value =
                                            1;
                                        onBoardingController.pageController
                                            .nextPage(
                                                duration:
                                                    Duration(milliseconds: 250),
                                                curve: Curves.easeIn);
                                      } else if (onBoardingController
                                              .currentPage.value ==
                                          1) {
                                        onBoardingController.currentPage.value =
                                            2;
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
              height: getHeight(8),
              width: getWidth(30),
              child: Padding(
                padding: EdgeInsets.all(1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.greyColor78,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(right: 5),
              height: getHeight(5),
              width: getWidth(12),
              decoration: BoxDecoration(
                color: ColorConstant.greyColor78,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
    );
  }
}
