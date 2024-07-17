import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:schoolxon/presentation/exam_resources_screen/controller/exam_resources_screen_controller.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/custom_elavated_button.dart';
import '../../widgets/custom_image_view.dart';

class ExamResourcesScreen extends GetWidget<ExamResourcesScreenController> {
  const ExamResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
  return SafeArea(
    child: Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              color: ColorConstant.blueF9,
              child: Padding(
                padding: EdgeInsets.only(
                  top: getHeight(5),
                ), // Add padding at the bottom
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: getWidth(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(
                                  width: 0.4, color: ColorConstant.primaryWhite),borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(
                                  Icons.close,
                                  size: 25,
                                  color: ColorConstant.primaryWhite,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, top: 20, bottom: 20),
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(
                                    width: 2, color: ColorConstant.primaryWhite),borderRadius: BorderRadius.circular(50)),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(
                                  Icons.question_mark_sharp,
                                  size: 15,
                                  color: ColorConstant.primaryWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getHeight(10),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "English Exam",
                              style: PMT.style(14,
                                  fontColor: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: getHeight(5),
                            ),
                            Text(
                              'Basic English: Vol 2 ',
                              style: PMT.style(19,
                                  fontColor: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: getHeight(40),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getHeight(5),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: ColorConstant.primaryWhite),
                        child:Padding(
                          padding: const EdgeInsets.only(
                            top: 18,
                            right: 18,
                            left: 18,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                               '4 Resources',
                                style: PMT.style(16,
                                    fontColor: ColorConstant.grey9A,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: getHeight(20),
                              ),
                              ListView.builder(
                                shrinkWrap: true, // Ensures the ListView only occupies the space it needs
                                physics: NeverScrollableScrollPhysics(), // Disables the scrolling of the ListView
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: ColorConstant.grey9A),
                                          borderRadius: BorderRadius.circular(9),
                                        ),
                                        padding: const EdgeInsets.all(6),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                          child: Row(
                                            children: [
                                              CustomImageView(
                                                svgPath: ImageConstant.icNote,
                                                height: getHeight(25),
                                                width: getWidth(25),
                                              ),
                                              SizedBox(
                                                width: getWidth(10),
                                              ),
                                              Text(
                                                'Exercise ${index + 1}',
                                                style: PMT.style(16,
                                                    fontColor: ColorConstant.primaryBlack,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: getHeight(15),
                                      ),
                                    ],
                                  );
                                },
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}