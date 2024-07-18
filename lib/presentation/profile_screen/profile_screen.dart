import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/image_constant.dart';
import 'package:schoolxon/core/utils/network_url.dart';
import 'package:schoolxon/presentation/profile_screen/widgets/text_field_title.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/common_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/common_appBar.dart';
import '../../widgets/custom_elavated_button.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/profile_screen_controller.dart';

class ProfileScreen extends GetWidget<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(title: AppString.myProfile)),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: ColorConstant.primaryBlue,
                ))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getHeight(25),
                      ),
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Obx(
                              () => controller.image.value
                                      .contains('https://api.')
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CustomImageView(
                                        fit: BoxFit.cover,
                                        url: controller.image.value,
                                        // 'https://api.aischoolara.com/uploads/student_images/1712198536-1179694613660e13885ca6e!WhatsApp%20Image%202024-04-04%20at%208.03.20%20AM%20(1).jpeg',
                                        // '${NetworkUrl.imageBaseUrl}${controller.studentModel.value.studentInfo?.image ?? ''}',
                                        // imagePath: ImageConstant.imgPerson,
                                        placeHolder:
                                            ImageConstant.imgUserPlaceHolder,
                                        height: getHeight(100),
                                        width: getHeight(100),
                                      ))
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CustomImageView(
                                        fit: BoxFit.cover,
                                        file: File(controller.image.value),
                                        // 'https://api.aischoolara.com/uploads/student_images/1712198536-1179694613660e13885ca6e!WhatsApp%20Image%202024-04-04%20at%208.03.20%20AM%20(1).jpeg',
                                        // '${NetworkUrl.imageBaseUrl}${controller.studentModel.value.studentInfo?.image ?? ''}',
                                        // imagePath: ImageConstant.imgPerson,
                                        placeHolder:
                                            ImageConstant.imgUserPlaceHolder,
                                        height: getHeight(100),
                                        width: getHeight(100),
                                      )),
                            ),
                            Obx(
                              () => !controller.hasEdit.value
                                  ? Bounce(
                                      onTap: () async {
                                        var result = await CommonConstant
                                            .instance
                                            .requestFilePermission();
                                        if (result) {
                                          CommonConstant.instance
                                              .CustomCupertinoBottomDilouge(
                                                  context: context,
                                                  firstText: AppString.camera,
                                                  secondTextColor: ColorConstant
                                                      .redWithOpecity,
                                                  firstTextOnTap: () async {
                                                    Get.back();
                                                    final resultImage =
                                                        await CommonConstant
                                                            .instance
                                                            .selectImageFromSystem(
                                                                ImageSource
                                                                    .camera);

                                                    controller.image.value =
                                                        resultImage?.path ?? '';
                                                  },
                                                  secondText: AppString.gallery,
                                                  secondTextOnTap: () async {
                                                    Get.back();
                                                    final resultImage =
                                                        await CommonConstant
                                                            .instance
                                                            .selectImageFromSystem(
                                                                ImageSource
                                                                    .gallery);

                                                    controller.image.value =
                                                        resultImage?.path ?? '';
                                                  });
                                        } else {
                                          CommonConstant.instance
                                              .CustomCupertinoAlertDilouge(
                                                  context: context,
                                                  Header: AppString
                                                      .storagePermission,
                                                  subTitle: AppString
                                                      .storagePermissionTest,
                                                  yesButtonText: AppString.yes,
                                                  noButtonText:
                                                      AppString.cancel,
                                                  yesButtonColor:
                                                      ColorConstant.primaryRed,
                                                  yesButtonTap: () {
                                                    Get.back();
                                                    openAppSettings();
                                                  });
                                        }
                                      },
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Container(
                                              color: ColorConstant.primaryBlue,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                ),
                                              ))),
                                    )
                                  : SizedBox.shrink(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                      Obx(
                        () => controller.hasEdit.value
                            ? Center(
                                child: SizedBox(
                                  width: getWidth(80),
                                  height: getHeight(30),
                                  child: AppElevatedButton(
                                    buttonName: AppString.edit,
                                    onPressed: () {
                                      controller.hasEdit.value = false;
                                    },
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      Container(
                        height: 4,
                        color: ColorConstant.dividerGreyE1,
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      TextFieldWidget(
                        title: AppString.firstName,
                        hintText: AppString.enterFirstName,
                        readOnly: true,
                        controller: controller.nameController.value,
                      ),
                      TextFieldWidget(
                        title: AppString.lastName,
                        readOnly: true,
                        hintText: AppString.enterLastName,
                        controller: controller.lastController.value,
                      ),
                      TextFieldWidget(
                        title: AppString.email,
                        readOnly: controller.hasEdit.value,
                        hintText: AppString.enterEmail,
                        controller: controller.emailController.value,
                      ),
                      TextFieldWidget(
                        title: AppString.mobileNo,
                        readOnly: controller.hasEdit.value,
                        hintText: AppString.enterMobileNo,
                        controller: controller.mobileController.value,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.gender,
                              style: PMT.style(16),
                            ),
                          ],
                        ),
                      ),
                      IgnorePointer(
                        ignoring: controller.hasEdit.value,
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: Text(AppString.male),
                                activeColor: ColorConstant.blueSecondary,
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                value: AppString.male,
                                groupValue: controller.gender.value,
                                onChanged: (value) {
                                  controller.gender.value = value.toString();
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                activeColor: ColorConstant.blueSecondary,
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                title: Text(AppString.female),
                                value: AppString.female,
                                groupValue: controller.gender.value,
                                onChanged: (value) {
                                  controller.gender.value = value.toString();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: ColorConstant.dividerGreyE1,
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.dob,
                              style: PMT.style(16),
                            ),
                            IgnorePointer(
                              ignoring: controller.hasEdit.value,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    child: Text(controller.selectedDate.value,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000))),
                                    onTap: () {
                                      controller.selectDate(context);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: () {
                                      controller.selectDate(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: ColorConstant.dividerGreyE1,
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                      TextFieldWidget(
                        title: AppString.currentAddress,
                        readOnly: controller.hasEdit.value,
                        hintText: AppString.enterCurrentAddress,
                        controller: controller.currentController.value,
                      ),
                      TextFieldWidget(
                        title: AppString.permanentAddress,
                        readOnly: controller.hasEdit.value,
                        hintText: AppString.enterPermanentAddress,
                        controller: controller.permanentController.value,
                      ),
                      TextFieldWidget(
                        title: AppString.aadhaarNo,
                        readOnly: controller.hasEdit.value,
                        hintText: AppString.enterAadhaarNo,
                        controller: controller.aadhaarController.value,
                      ),
                      SizedBox(
                        height: getHeight(50),
                      ),
                      Obx(
                        () => !controller.hasEdit.value
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getWidth(16),vertical: getHeight(5)),
                                child: AppElevatedButton(
                                  isLoading: controller.isUpdateLoading.value,
                                  buttonName: AppString.update,
                                  // isDisable: true,
                                  onPressed: () {
                                    controller.next();
                                  },
                                ),
                              )
                            : SizedBox.shrink(),
                      )
                    ],
                  ),
                ),
        ));
  }
}
