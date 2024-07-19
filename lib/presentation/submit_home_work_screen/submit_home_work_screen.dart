import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolxon/core/utils/color_constant.dart';

import '../../core/utils/app_fonts.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/custom_elavated_button.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/submit_home_work_screen_controller.dart';

class SubmitHomeWorkScreen extends GetWidget<SubmitHomeWorkScreenController> {
  const SubmitHomeWorkScreen({super.key});

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
                color: ColorConstant.primaryBlue.withOpacity(.7),
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
                          padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(
                                    Icons.close,
                                    size: 25,
                                    color: ColorConstant.primaryWhite,
                                  ),
                                ),
                              ),
                              Text(
                                AppString.homework,
                                style: PMT.style(16,
                                    fontColor: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    right: 5, top: 20, bottom: 20),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getHeight(70),
                              width: getWidth(70),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: ColorConstant.primaryWhite),
                              child: Center(
                                child: Text(
                                  'En',
                                  style: PMT.style(25,
                                      fontColor: ColorConstant.primaryBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
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
                                "English",
                                style: PMT.style(19,
                                    fontColor: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: getHeight(5),
                              ),
                              Text(
                                'Home Work | Assignment | Test',
                                style: PMT.style(14,
                                    fontColor: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: getHeight(10),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                  right: 18,
                                  left: 18,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppString.description,
                                      style: PMT.style(16,
                                          fontColor: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: getHeight(10),
                                    ),
                                    Text(
                                      'if need any help ping me on chat i will help you',
                                      style: PMT.style(16,
                                          fontColor: ColorConstant.grey9A,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: getHeight(15),
                                    ),
                                    Text(
                                      AppString.attachments,
                                      style: PMT.style(0).copyWith(
                                          color: ColorConstant.grey7A,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(17)),
                                    ),
                                    SizedBox(
                                      height: getHeight(12),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.pickImage();
                                      },
                                      child: Center(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: DottedBorder(
                                            padding: const EdgeInsets.all(20),
                                            color: Colors.grey,
                                            strokeWidth: 3,
                                            dashPattern: [5, 4],
                                            child: Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(10),
                                              child: Obx(() {
                                                return Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    controller.selectedImage.value != null
                                                        ? Image.file(
                                                      controller.selectedImage.value!,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    )
                                                        : Column(
                                                      children: [
                                                        Icon(
                                                          Icons.file_upload_outlined,
                                                          color: Colors.black,
                                                          size: 40,
                                                        ),
                                                        RichText(
                                                          text: const TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'Choose Your File ',
                                                                style: TextStyle(
                                                                    color: Colors.blue,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 15),
                                                              ),
                                                              TextSpan(
                                                                text: ' To Upload',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 15),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Text(
                                                          'Img Or Doc',
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              }),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getHeight(20),
                                    ),
                                    Obx(
                                          () {
                                        print('Selected Image: ${controller.selectedImage.value}');
                                        print('Progress: ${controller.progress.value}');
                                        return controller.selectedImage.value != null &&
                                            controller.progress.value <= 1
                                            ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: ColorConstant.greyE4.withOpacity(0.4),
                                          ),
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomImageView(
                                                      svgPath: ImageConstant.icPdf,
                                                      height: getHeight(35),
                                                      width: getWidth(35),
                                                    ),
                                                    SizedBox(width: getWidth(20)),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          controller.selectedImage.value!.path.split('/').last,
                                                          style: PMT.style(0).copyWith(
                                                            color: ColorConstant.primaryBlack,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: getFontSize(13),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${(controller.selectedImage.value!.lengthSync() / 1024).toStringAsFixed(0)} KB',
                                                          style: PMT.style(0).copyWith(
                                                            color: ColorConstant.grey7A,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: getFontSize(12),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            controller.removeImage();
                                                          },
                                                          child: const Icon(
                                                            Icons.close,
                                                            color: ColorConstant.primaryBlack,
                                                            size: 24,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${(controller.progress.value * 100).toStringAsFixed(0)}%',
                                                          style: PMT.style(0).copyWith(
                                                            color: ColorConstant.grey7A,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: getFontSize(12),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: getHeight(15),
                                                ),
                                                LinearProgressIndicator(
                                                  value: controller.progress.value,
                                                  minHeight: 6.0,
                                                  backgroundColor: Colors.white,
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    Colors.blueAccent,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                        )
                                            : SizedBox.shrink();
                                      },
                                    ),
                                    SizedBox(
                                      height: getHeight(100),
                                    ),
                                    AppElevatedButton(
                                      buttonName: AppString.applyLeave,
                                      onPressed: () {},
                                      buttonColor: ColorConstant.primaryBlue,
                                    )
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
          ],
        ),
      ),
    );
  }
}
