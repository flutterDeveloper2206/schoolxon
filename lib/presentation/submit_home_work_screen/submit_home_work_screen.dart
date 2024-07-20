import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolxon/core/utils/color_constant.dart';

import '../../core/utils/app_fonts.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/bouncing_button.dart';
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(color: ColorConstant.primaryBlue,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Column(
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getHeight(5),
                    ),
                  ],
                ),
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
                          TextFormField(
                            maxLines: 4,
                            controller: controller.descriptionController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppString.addDescription,
                                hintStyle: PMT.appStyle(14)),
                          ),
                          Container(
                            height: 2,
                            color: ColorConstant.greyE4,
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
                                              const Icon(
                                                Icons.file_upload_outlined,
                                                color: Colors.black,
                                                size: 40,
                                              ),
                                              RichText(
                                                text:  TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: AppString.chooseFile,
                                                      style: PMT.appStyle(
                                                          14, fontColor: ColorConstant.primaryBlue,fontWeight: FontWeight.bold),
          
                                                    ),
                                                    TextSpan(
                                                      text: AppString.toUpload,
                                                      style:PMT.appStyle(
                                                          14, fontColor: ColorConstant.primaryBlack,fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                               Text(
                                                AppString.imgOrDoc,
                                                style: PMT.appStyle(
                                                    14, fontColor: ColorConstant.grey9A,fontWeight: FontWeight.bold),
          
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
                              return controller.selectedImage.value != null &&
                                  controller.progress.value < 1.8
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
                                                style: PMT.appStyle(13,
                                                  fontColor: ColorConstant.primaryBlack,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                              Text(
                                                '${(controller.selectedImage.value!.lengthSync() / 1024).toStringAsFixed(0)} KB',
                                                style: PMT.appStyle(12,
                                                  fontColor: ColorConstant.grey7A,
                                                  fontWeight: FontWeight.bold,
                                                )

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
                                              (controller.progress.value * 100).toStringAsFixed(0) ==
                                                  '100'
                                                  ? const SizedBox.shrink()
                                                  : Text(
                                                '${(controller.progress.value * 100).toStringAsFixed(0)}%',
                                                style: PMT.appStyle(12,
                                                  fontColor: ColorConstant.grey7A,
                                                  fontWeight: FontWeight.bold,
                                                )

                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: getHeight(15),
                                      ),
                                      (controller.progress.value * 100).toStringAsFixed(0) == '100'
                                          ? const SizedBox.shrink()
                                          : LinearProgressIndicator(
                                        value: controller.progress.value,
                                        minHeight: 6.0,
                                        backgroundColor: Colors.white,
                                        valueColor: const AlwaysStoppedAnimation<Color>(
                                          ColorConstant.primaryBlue,
                                        ),
                                      ),
                                      (controller.progress.value * 100).toStringAsFixed(0) == '100'
                                          ? const SizedBox.shrink()
                                          : const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              )
                                  : const SizedBox.shrink();
                            },
                          ),
                          SizedBox(
                            height: getHeight(80),
                          ),
                          Obx(()=>
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: AppElevatedButton(

                                buttonName: AppString.submit,
                                onPressed: () {
                                  controller.submit();
                                },
                                isLoading: controller.isUpdateLoading.value,
                                buttonColor: ColorConstant.primaryBlue,
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
    );
  }
}
