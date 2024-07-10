import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    {"image": ImageConstant.imgOnboardind1},
    {"image": ImageConstant.imgOnboardind2},
    {"image": ImageConstant.imgOnboardind3},
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
                    padding: EdgeInsets.only(right: (16),),
                    child: InkWell(
                      onTap: () {
                        onBoardingController.onTapOfGetStartedButton();
                      },
                      child: Text(
                        "skip",
                        style: PMT.style(18).copyWith(
                            color: ColorConstant.blueFC,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(18)),
                      ),
                    ),
                  ),
                ],
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

                    Positioned(top: 200,
                      child: Container(
                        height: getHeight(40),
                        width: double.infinity,
                        // Below is the code for Linear Gradient.
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white10, ColorConstant.blueF9],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onBoardingData.length,
                                  (index) => buildDot(index: index),
                            ),
                          ),

                          SizedBox(
                            height: getHeight(40),
                          ),
                          Container(color: Colors.white,
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.only(left: (20), right: (20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height / 50,
                                  ),
                                  Obx(
                                        () => Text(
                                      onBoardingController.currentPage.value == 1
                                          ? "walkthrough 1"
                                          : onBoardingController.currentPage.value ==
                                          2
                                          ? "walkthrough 2"
                                          : "walkthrough 3",
                                      style: PMT.style(18).copyWith(
                                          color: ColorConstant.black72,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(18)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getHeight(10),
                                  ),
                                  Obx(
                                        () => Text(
                                      onBoardingController.currentPage.value == 1
                                          ? "Makes easier for users to pay for their purchases by scanning the QR code"
                                          : onBoardingController.currentPage.value ==
                                          2
                                          ? "Supports many types of payments and pay without being complicated"
                                          : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
                                      textAlign: TextAlign.center,
                                      style: PMT.style(15).copyWith(
                                          color: ColorConstant.black72,
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(15)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getHeight(30),
                                  ),
                                  Obx(
                                        () => AppElevatedButton(buttonShadowColor:ColorConstant.transparent ,
                                      buttonName:
                                      onBoardingController.currentPage.value == 2
                                          ? "Get Started"
                                          : "Next",
                                      textColor: Colors.white,
                                      buttonColor: ColorConstant.blueF9,
                                      radius: 16,
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
              height: getHeight(10),
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
