import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/widgets/custom_elavated_button.dart';

import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import 'controller/home_work_detail_screen_controller.dart';

class HomeWorkDetailScreen extends GetWidget<HomeWorkDetailScreenController> {
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
                color: ColorConstant.blueF9.withOpacity(.7),
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
                                      fontColor: ColorConstant.blueF9,
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
                                  ],
                                ),
                              ),
                              const Divider(
                                  color: ColorConstant.whiteFB, thickness: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppString.attachments,
                                      style: PMT.style(16,
                                          fontColor: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: getHeight(15),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorConstant.greyE4),
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: getHeight(40),
                                              width: getWidth(40),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(50),
                                                  color: ColorConstant.blueFC
                                                      .withOpacity(.2)),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(12),
                                                child: CustomImageView(
                                                  svgPath: ImageConstant.icClip,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: getWidth(15),
                                            ),
                                            Text(
                                              'Read Ch. 16.1 - 16.2,\nEx A1 - A5',
                                              style: PMT.style(15,
                                                  fontColor:
                                                  ColorConstant.grey9A,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.file_download_outlined,
                                              color: ColorConstant.blueF9,
                                              size: 35,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getHeight(15),
                                    ),
                                    AppElevatedButton(
                                      buttonName: AppString.uploadYourFile,
                                      onPressed: () {
                                        showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(0)),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 35),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                    children: <Widget>[
                                                      Column(
                                                        children: [
                                                          Container(
                                                            height: getHeight(
                                                                50),
                                                            width:
                                                            getHeight(50),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    50),
                                                                border: Border
                                                                    .all(
                                                                  color: ColorConstant
                                                                      .primaryBlack,
                                                                )),
                                                            child: IconButton(
                                                              icon: const Icon(Icons
                                                                  .camera_alt_outlined),
                                                              onPressed: () {
                                                                controller.openCamera();
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                            getHeight(15),
                                                          ),
                                                          Text(
                                                            AppString.camera,
                                                            style: PMT.style(16,
                                                                fontColor:
                                                                ColorConstant
                                                                    .grey9A,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            height: getHeight(
                                                                50),
                                                            width:
                                                            getHeight(50),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    50),
                                                                border: Border
                                                                    .all(
                                                                  color: ColorConstant
                                                                      .primaryBlack,
                                                                )),
                                                            child: IconButton(
                                                              icon: const Icon(Icons
                                                                  .file_upload_outlined),
                                                              onPressed: () {

                                                                Get.back();
                                                                showModalBottomSheet(
                                                                  isScrollControlled: true,
                                                                  backgroundColor: ColorConstant.primaryWhite,
                                                                  shape: const RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                                                                  context: context,
                                                                  builder: (BuildContext context) {
                                                                    return Column(mainAxisSize: MainAxisSize.min,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(right: 18,left: 18,top: 20,bottom: 10),
                                                                          child: Text(
                                                                            AppString.yourWorks,
                                                                            style: PMT.style(16,
                                                                                fontColor: ColorConstant.primaryBlack,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),

                                                                        const Divider(color:ColorConstant.greyE4,thickness: 4,),
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                                                                          child: Column(
                                                                            children: [
                                                                              Container(
                                                                                decoration: BoxDecoration(   border: Border.all(
                                                                                    color: ColorConstant.greyE4),
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                width: double.infinity,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      CustomImageView(
                                                                                        imagePath: ImageConstant.pdf1,
                                                                                        height: getHeight(35),
                                                                                        width: getWidth(35),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: getWidth(10),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            SizedBox(
                                                                                              width: getWidth(10),
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                Text(
                                                                                                  'My Work.Pdf',
                                                                                                  style: PMT.style(0).copyWith(
                                                                                                    color:
                                                                                                    ColorConstant.primaryBlack,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontSize: getFontSize(13),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: getWidth(10),
                                                                                                ),
                                                                                                Text(
                                                                                                  '7.5 Mb',
                                                                                                  style: PMT.style(0).copyWith(
                                                                                                    color: ColorConstant.grey7A,
                                                                                                    fontWeight: FontWeight.w400,
                                                                                                    fontSize: getFontSize(12),
                                                                                                  ),
                                                                                                ),
                                                                                                const Spacer(),
                                                                                                Obx(()=>
                                                                                                    Text(
                                                                                                      '${(controller.progress.value * 100).toStringAsFixed(0)}%',
                                                                                                      style: PMT.style(0).copyWith(
                                                                                                        color: ColorConstant.grey7A,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontSize: getFontSize(12),
                                                                                                      ),
                                                                                                    ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: getHeight(10),
                                                                                            ),
                                                                                            LinearProgressIndicator(borderRadius: BorderRadius.circular(20),
                                                                                              value: controller.progress.value,
                                                                                              minHeight: 6.0,
                                                                                              backgroundColor: ColorConstant.greyE4,
                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                  Colors.blueAccent),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: getHeight(15),),
                                                                              Container(
                                                                                decoration: BoxDecoration(   border: Border.all(
                                                                                    color: ColorConstant.greyE4),
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                width: double.infinity,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      CustomImageView(
                                                                                        imagePath: ImageConstant.image,
                                                                                        height: getHeight(35),
                                                                                        width: getWidth(35),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: getWidth(10),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            SizedBox(
                                                                                              width: getWidth(10),
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                Text(
                                                                                                  'My Work.Pdf',
                                                                                                  style: PMT.style(0).copyWith(
                                                                                                    color:
                                                                                                    ColorConstant.primaryBlack,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontSize: getFontSize(13),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: getWidth(10),
                                                                                                ),
                                                                                                Text(
                                                                                                  '7.5 Mb',
                                                                                                  style: PMT.style(0).copyWith(
                                                                                                    color: ColorConstant.grey7A,
                                                                                                    fontWeight: FontWeight.w400,
                                                                                                    fontSize: getFontSize(12),
                                                                                                  ),
                                                                                                ),
                                                                                                const Spacer(),
                                                                                                Obx(()=>
                                                                                                    Text(
                                                                                                      '${(controller.progress.value * 100).toStringAsFixed(0)}%',
                                                                                                      style: PMT.style(0).copyWith(
                                                                                                        color: ColorConstant.grey7A,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontSize: getFontSize(12),
                                                                                                      ),
                                                                                                    ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: getHeight(10),
                                                                                            ),
                                                                                            LinearProgressIndicator(borderRadius: BorderRadius.circular(20),
                                                                                              value: controller.progress.value,
                                                                                              minHeight: 6.0,
                                                                                              backgroundColor: ColorConstant.greyE4,
                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                  Colors.blueAccent),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: getHeight(160),),
                                                                            ],
                                                                          ),
                                                                        ),


                                                                      ],
                                                                    );
                                                                  },
                                                                );

                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                            getHeight(15),
                                                          ),
                                                          Text(
                                                            AppString.upload,
                                                            style: PMT.style(16,
                                                                fontColor:
                                                                ColorConstant
                                                                    .grey9A,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            height: getHeight(
                                                                50),
                                                            width:
                                                            getHeight(50),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    50),
                                                                border: Border
                                                                    .all(
                                                                  color: ColorConstant
                                                                      .primaryBlack,
                                                                )),
                                                            child: IconButton(
                                                              icon: const Icon(Icons
                                                                  .photo_outlined),
                                                              onPressed: () {
                                                                controller.openGallery();
                                                                // Implement gallery functionality
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                            getHeight(15),
                                                          ),
                                                          Text(
                                                            AppString.gallery,
                                                            style: PMT.style(16,
                                                                fontColor:
                                                                ColorConstant
                                                                    .grey9A,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                  color: ColorConstant.whiteFB, thickness: 5),
                              SizedBox(
                                height: getHeight(10),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 18,
                                  left: 18,
                                  bottom:
                                  MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppString.comments,
                                      style: PMT.style(16,
                                          fontColor: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: getHeight(20),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: getHeight(45),
                                          width: getWidth(45),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(50),
                                              color: ColorConstant.blueF9),
                                          child: Center(
                                            child: Text(
                                              'En',
                                              style: PMT.style(15,
                                                  fontColor: ColorConstant
                                                      .primaryWhite,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: getWidth(20),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'You',
                                              style: PMT.style(16,
                                                  fontColor: ColorConstant
                                                      .primaryBlack,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: getHeight(4),
                                            ),
                                            Text(
                                              'Hi Mam I Need Your Help',
                                              style: PMT.style(15,
                                                  fontColor:
                                                  ColorConstant.grey9A,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getHeight(20),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: getHeight(45),
                                          width: getWidth(45),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(50),
                                              color: ColorConstant.blueF9),
                                          child: Center(
                                            child: Text(
                                              'En',
                                              style: PMT.style(15,
                                                  fontColor: ColorConstant
                                                      .primaryWhite,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: getWidth(20),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'You',
                                              style: PMT.style(16,
                                                  fontColor: ColorConstant
                                                      .primaryBlack,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: getHeight(4),
                                            ),
                                            Text(
                                              'Hi Mam I Need Your Help',
                                              style: PMT.style(15,
                                                  fontColor:
                                                  ColorConstant.grey9A,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                  color: ColorConstant.whiteFB, thickness: 2),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: const BoxDecoration(
                                    color: ColorConstant.primaryWhite,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(0)),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 35),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: <Widget>[
                                                    Column(
                                                      children: [
                                                        Container(
                                                          height:
                                                          getHeight(50),
                                                          width: getHeight(50),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  50),
                                                              border: Border.all(
                                                                color: ColorConstant
                                                                    .primaryBlack,
                                                              )),
                                                          child: IconButton(
                                                            icon: const Icon(Icons
                                                                .camera_alt_outlined),
                                                            onPressed: () {
                                                              // Implement camera functionality
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                          getHeight(15),
                                                        ),
                                                        Text(
                                                          AppString.camera,
                                                          style: PMT.style(16,
                                                              fontColor:
                                                              ColorConstant
                                                                  .grey9A,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          height:
                                                          getHeight(50),
                                                          width: getHeight(50),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  50),
                                                              border: Border.all(
                                                                color: ColorConstant
                                                                    .primaryBlack,
                                                              )),
                                                          child: IconButton(
                                                            icon: const Icon(Icons
                                                                .file_upload_outlined),
                                                            onPressed: () {
                                                              // Implement upload functionality
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                          getHeight(15),
                                                        ),
                                                        Text(
                                                          AppString.upload,
                                                          style: PMT.style(16,
                                                              fontColor:
                                                              ColorConstant
                                                                  .grey9A,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          height:
                                                          getHeight(50),
                                                          width: getHeight(50),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  50),
                                                              border: Border.all(
                                                                color: ColorConstant
                                                                    .primaryBlack,
                                                              )),
                                                          child: IconButton(
                                                            icon: const Icon(Icons
                                                                .photo_outlined),
                                                            onPressed: () {
                                                              // Implement gallery functionality
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                          getHeight(15),
                                                        ),
                                                        Text(
                                                          AppString.gallery,
                                                          style: PMT.style(16,
                                                              fontColor:
                                                              ColorConstant
                                                                  .grey9A,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child:  TextField(onTap: (){
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: ColorConstant.primaryWhite,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Padding(
                                            padding:  EdgeInsets.only(top: 18,left: 18,right: 18,bottom: MediaQuery.of(context).viewInsets.bottom),
                                            child: Column(mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      AppString.comments,
                                                      style: PMT.style(16,
                                                          fontColor: ColorConstant.primaryBlack,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.close))
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: getHeight(20),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: getHeight(45),
                                                      width: getWidth(45),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(50),
                                                          color: ColorConstant.blueF9),
                                                      child: Center(
                                                        child: Text(
                                                          'En',
                                                          style: PMT.style(15,
                                                              fontColor: ColorConstant
                                                                  .primaryWhite,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: getWidth(20),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'You',
                                                          style: PMT.style(16,
                                                              fontColor: ColorConstant
                                                                  .primaryBlack,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                        SizedBox(
                                                          height: getHeight(4),
                                                        ),
                                                        Text(
                                                          'Hi Mam I Need Your Help',
                                                          style: PMT.style(15,
                                                              fontColor:
                                                              ColorConstant.grey9A,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: getHeight(20),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: getHeight(45),
                                                      width: getWidth(45),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(50),
                                                          color: ColorConstant.blueF9),
                                                      child: Center(
                                                        child: Text(
                                                          'En',
                                                          style: PMT.style(15,
                                                              fontColor: ColorConstant
                                                                  .primaryWhite,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: getWidth(20),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'You',
                                                          style: PMT.style(16,
                                                              fontColor: ColorConstant
                                                                  .primaryBlack,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                        SizedBox(
                                                          height: getHeight(4),
                                                        ),
                                                        Text(
                                                          'Hi Mam I Need Your Help',
                                                          style: PMT.style(15,
                                                              fontColor:
                                                              ColorConstant.grey9A,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: getHeight(20),
                                                ),
                                                 Divider(height: getHeight(10),
                                                    color: ColorConstant.greyE4, thickness: 2),
                                                const TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.send,color:ColorConstant.grey9A ,),
                                                  hintText: "Add Your Comment",
                                                  hintStyle: TextStyle(
                                                      color: ColorConstant.grey9A),
                                                  border: InputBorder.none,
                                                ),)
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                      readOnly: true,
                                      decoration: const InputDecoration(suffixIcon: Icon(Icons.send,color:ColorConstant.grey9A ,),
                                        hintText: "Add Your Comment",
                                        hintStyle: TextStyle(
                                            color: ColorConstant.grey9A),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
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
