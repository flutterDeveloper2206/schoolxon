import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../widgets/custom_elavated_button.dart';
import 'controller/onboarding_screen_controller.dart';
import 'onBoardingContant_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  var onBoardingController = Get.find<OnBoardingScreenController>();

  List<Map<String, String>> onBoardingData = [
    {"image": "asset/icons/onBoarding11.png"},
    {"image": "asset/icons/onBoarding22.png"},
    {"image": "asset/icons/onBoarding33.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {

          onBoardingController.pageController.animateToPage(onBoardingController.currentPage.value-1, duration: Duration(milliseconds: 250),
              curve: Curves.easeIn);
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {

          onBoardingController.pageController.animateToPage(onBoardingController.currentPage.value+1, duration: Duration(milliseconds: 250),
              curve: Curves.easeIn);
        }
      },
      child: Scaffold(
          backgroundColor: ColorConstant.primaryWhite,
          body: Column(
            children: [
              SizedBox(
                height: getHeight(60),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: (16), top: (20)),
                    child: InkWell(
                      onTap: () {
                        onBoardingController.onTapOfGetStartedButton();
                      },
                      child: Text(
                        "Skip",
                        style: PMT.style(20).copyWith(
                            color: ColorConstant.bgGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(20)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Expanded(
                child: PageView.builder(
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
                      height: getHeight(36),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: (20),
                            right: (20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                            Obx(
                              () => Text(
                                onBoardingController.currentPage.value == 1
                                    ? "Scan & Pay"
                                    : onBoardingController.currentPage.value == 2
                                        ? "Pay Anything"
                                        : "Loan",
                                style:  PMT.style(20).copyWith(
                                    color: ColorConstant.bgGrey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(32)),
                              ),
                            ),
                            SizedBox(
                              height: getHeight(10),
                            ),
                            Obx(
                              () => Text(
                                onBoardingController.currentPage.value == 1
                                    ? "Makes easier for users to pay for their purchases by scanning the QR code"
                                    : onBoardingController.currentPage.value == 2
                                        ? "Supports many types of payments and pay without being complicated"
                                        : "Making it easier for users to make an informed decision about their loan",
                                textAlign: TextAlign.center,
                                style: PMT.style(20).copyWith(
                                    color: ColorConstant.greyBack,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(22)),
                              ),
                            ),
                            Spacer(),
                            Obx(
                              () => AppElevatedButton(
                                buttonName:
                                    onBoardingController.currentPage.value == 2
                                        ? "Get Started"
                                        : "Next",
                                textColor: Colors.white,
                                buttonColor: ColorConstant.bgGrey,
                                radius: 16,
                                onPressed: () {
                                  if(onBoardingController.currentPage.value==0){
                                    onBoardingController.currentPage.value = 1;
                                    onBoardingController.pageController.nextPage(
                                        duration: Duration(milliseconds: 250),
                                        curve: Curves.easeIn
                                    );

                                  }else if(onBoardingController.currentPage.value==1){
                                    onBoardingController.currentPage.value = 2;
                                    onBoardingController.  pageController.nextPage(
                                        duration: Duration(milliseconds: 250),
                                        curve: Curves.easeIn
                                    );
                                  }else if(onBoardingController.currentPage.value==2){
                                    onBoardingController.onTapOfGetStartedButton();
                                  }

                                },
                              ),
                            ),
                            SizedBox(
                              height: getHeight(60),
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
              height: getHeight(12),
              width: getWidth(12),
              decoration: BoxDecoration(
                color: ColorConstant.primaryWhite,
                border: Border.all(
                    color: ColorConstant.greyBack, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.greyBack,
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
                color: ColorConstant.grey61,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
    );
  }
}
