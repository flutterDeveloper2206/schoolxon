import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:schoolxon/presentation/home_screen/controller/home_screen_controller.dart';

import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/custom_image_view.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorConstant.blue6F,
                      ColorConstant.blue9c,
                      ColorConstant.blueColor42,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: EdgeInsets.only(top: getHeight(10)),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getWidth(18)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.icLogo,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border:
                                        Border.all(color: Colors.transparent)),
                                padding: const EdgeInsets.all(10),
                                child: CustomImageView(
                                  svgPath: ImageConstant.icProfileLogo,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getHeight(20),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    ColorConstant.blue6F.withOpacity(.2),
                                    ColorConstant.blue53.withOpacity(.2),
                                    ColorConstant.blueColor42.withOpacity(.2),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                                border: Border.all(
                                    width: 0.4, color: const Color(0xFFC4C4C4)),
                                borderRadius: const BorderRadiusDirectional.all(
                                    Radius.circular(20)),
                                color: ColorConstant.blueColor42),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 15, left: 16, bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        child: ClipRRect(borderRadius: BorderRadius.circular(50),
                                          child: CustomImageView(
                                            imagePath: ImageConstant.imgPerson,height: getHeight(40),width: getWidth(40),
                                          ),
                                        ),
                                        height: getHeight(50),
                                        width: getWidth(50),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width:2,
                                                color: const Color(0xFFC4C4C4)),
                                            borderRadius:
                                                const BorderRadiusDirectional
                                                    .all(Radius.circular(50)),
                                            color: ColorConstant.blueColor42),
                                      )),
                                  SizedBox(
                                    width: getWidth(10),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Praveen Kumar',
                                          style: PMT.style(0).copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.bold,
                                              fontSize: getFontSize(16))),
                                      SizedBox(
                                        height: getHeight(10),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorConstant.blueColor42
                                                  .withOpacity(.7),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 7),
                                              child: Text('ID NO: 18ubao4 ',
                                                  style: PMT.style(0).copyWith(
                                                      color:
                                                          ColorConstant.greyE4,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          getFontSize(12))),
                                            ),
                                          ),
                                          SizedBox(
                                            width: getWidth(10),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorConstant.blueColor42
                                                  .withOpacity(.7),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 7),
                                              child: Text('Class: III A',
                                                  style: PMT.style(0).copyWith(
                                                      color:
                                                          ColorConstant.greyE4,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          getFontSize(12))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getHeight(20),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    ColorConstant.blue6F.withOpacity(.2),
                                    ColorConstant.blue53.withOpacity(.2),
                                    ColorConstant.blueColor42.withOpacity(.2),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                                border: Border.all(
                                    width: 0.4, color: const Color(0xFFC4C4C4)),
                                borderRadius: const BorderRadiusDirectional.all(
                                    Radius.circular(20)),
                                color: ColorConstant.blueColor42),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 15, left: 16, bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.icClock,
                                    height: getHeight(30),
                                    width: getWidth(30),
                                  ),
                                  SizedBox(
                                    width: getWidth(10),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(AppString.PunchIn,
                                          style: PMT.style(0).copyWith(
                                              color: ColorConstant.greyColorB1,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getFontSize(11))),
                                      SizedBox(
                                        height: getHeight(10),
                                      ),
                                      Text('10.00 AM Wed, 11th Mar 2019 ',
                                          style: PMT.style(0).copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w600,
                                              fontSize: getFontSize(12))),
                                    ],
                                  ),
                                  SizedBox(
                                    width: getWidth(40),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: ColorConstant.greyE4,
                                        size: 15,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getHeight(45),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                color: ColorConstant.primaryWhite),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                child: Column(
                                  children: [
                                    Container(
                                      height: getHeight(5),
                                      width: getWidth(70),
                                      color: ColorConstant.greyE4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Row(
                                        children: [
                                          Text(
                                            AppString.menu,
                                            style: PMT.style(18,
                                                fontColor:
                                                    ColorConstant.primaryBlack,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 18,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icFees,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.fees,
                                                        style: PMT.style(15,
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
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icLeave,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.leave,
                                                        style: PMT.style(15,
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
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icNotepad,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.notePad,
                                                        style: PMT.style(15,
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
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icBus,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.bus,
                                                        style: PMT.style(15,
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
                                            Padding(
                                              padding: const EdgeInsets.all(18),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: ColorConstant.crimC7,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 25,
                                                            right: 10,
                                                            top: 20,
                                                            bottom: 20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Diwali',
                                                            style: PMT.style(0).copyWith(
                                                                color: ColorConstant
                                                                    .primaryBlack,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    getFontSize(
                                                                        14))),
                                                        Row(
                                                          children: [
                                                            Text('there will be no classes on 14th\nand will resume on 15th ',
                                                                style: PMT.style(0).copyWith(
                                                                    color: ColorConstant
                                                                        .grey9A,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        getFontSize(
                                                                            13))),
                                                            SizedBox(
                                                              width:
                                                                  getWidth(10),
                                                            ),
                                                            CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .icSpeaker,
                                                            ),
                                                          ],
                                                        ),
                                                        Text('Read More',
                                                            style: PMT.style(0).copyWith(
                                                                color:
                                                                    ColorConstant
                                                                        .blueF9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    getFontSize(
                                                                        12))),
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18,
                                                  right: 18,
                                                  bottom: 18,
                                                  top: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    AppString.academics,
                                                    style: PMT.style(18,
                                                        fontColor: ColorConstant
                                                            .primaryBlack,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icHomeWork,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.homework,
                                                        style: PMT.style(15,
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
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icLiveClass,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.livClass,
                                                        style: PMT.style(15,
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
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icMarks,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.marks,
                                                        style: PMT.style(15,
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
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icDiary,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.dairy,
                                                        style: PMT.style(15,
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25, top: 25, right: 70),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icTimeTable,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.timeTable,
                                                        style: PMT.style(15,
                                                            fontColor:
                                                                ColorConstant
                                                                    .grey9A,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: getWidth(5),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .icExam,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.exam,
                                                        style: PMT.style(15,
                                                            fontColor:
                                                                ColorConstant
                                                                    .grey9A,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: getWidth(5),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: getHeight(50),
                                                        width: getWidth(50),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                          color: ColorConstant
                                                              .blueFC
                                                              .withOpacity(.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child:
                                                              CustomImageView(
                                                            svgPath: ImageConstant
                                                                .icAttendance,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(6),
                                                      ),
                                                      Text(
                                                        AppString.attendence,
                                                        style: PMT.style(15,
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
                                            SizedBox(
                                              height: getHeight(30),
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
                )),
          ],
        ));
  }
}
