import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:schoolxon/core/utils/network_url.dart';
import 'package:schoolxon/core/utils/progress_dialog_utils.dart';
import 'package:schoolxon/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';

import '../../core/app_export.dart';
import '../../core/utils/app_prefs_key.dart';
import '../../core/utils/pref_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenController controller;
  @override
  void initState() {
    controller = Get.put(HomeScreenController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: ColorConstant.blueSecondary));
    sizeCalculate(context);
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: getHeight(345),
          floating: false,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorConstant.blue53.withOpacity(.6),
                    ColorConstant.blue6F,
                    ColorConstant.blueColor42,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: getHeight(20),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(18)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.icLogo,
                        ),
                        Bounce(
                          onTap: () {
                            Get.toNamed(AppRoutes.notificationScreenRout);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.notifications_none,
                                color: ColorConstant.primaryWhite,
                              )
                              // CustomImageView(
                              //   svgPath: ImageConstant.icProfileLogo,
                              // ),
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
                              ColorConstant.blue6F.withOpacity(.4),
                              ColorConstant.blue53.withOpacity(.4),
                              ColorConstant.blueColor42.withOpacity(.4),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          border: Border.all(
                              width: 0.4, color: const Color(0xFFC4C4C4)),
                          borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(20)),
                          color: ColorConstant.blueColor42),
                      width: double.infinity,
                      child: Bounce(
                        onTap: () {
                          Get.toNamed(AppRoutes.profileScreenRout);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10, top: 15, left: 16, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    height: getHeight(50),
                                    width: getWidth(50),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: const Color(0xFFC4C4C4)),
                                        borderRadius:
                                            const BorderRadiusDirectional.all(
                                                Radius.circular(50)),
                                        color: ColorConstant.blueColor42),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Obx(
                                        () => CustomImageView(
                                          fit: BoxFit.cover,
                                          url:
                                              '${NetworkUrl.imageBaseUrl}${controller.studentModel.value.studentInfo?.image ?? ''}',
                                          height: getHeight(40),
                                          width: getWidth(40),
                                          placeHolder:
                                              ImageConstant.imgUserPlaceHolder,
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                width: getWidth(10),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => Text(
                                        '${controller.studentModel.value.studentInfo?.firstname ?? ''} ${controller.studentModel.value.studentInfo?.middlename ?? ''}',
                                        style: PMT.style(0).copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.bold,
                                            fontSize: getFontSize(16))),
                                  ),
                                  SizedBox(
                                    height: getHeight(10),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                            maxWidth: getWidth(120)),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: ColorConstant.blueColor42
                                              .withOpacity(.7),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 7),
                                          child: Obx(
                                            () => Text(
                                                'ID NO: ${controller.studentModel.value.studentInfo?.admissionNo ?? ''} ',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: PMT.style(0).copyWith(
                                                    color: ColorConstant.greyE4,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: getFontSize(12))),
                                          ),
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 7),
                                          child: Obx(
                                            () => Text(
                                                'Class: ${controller.studentModel.value.studentInfo?.studentInfoClass ?? ''}',
                                                style: PMT.style(0).copyWith(
                                                    color: ColorConstant.greyE4,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: getFontSize(12))),
                                          ),
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
                              ColorConstant.blue6F.withOpacity(.4),
                              ColorConstant.blue53.withOpacity(.4),
                              ColorConstant.blueColor42.withOpacity(.4),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
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
                        child: Bounce(
                          onTap: () {
                            Get.toNamed(AppRoutes.attendanceScreenRout,
                                arguments: [
                                  {
                                    'attendanceModel':
                                        controller.attendanceModel
                                  }
                                ]);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.icClock,
                                    height: getHeight(30),
                                    width: getWidth(30),
                                  )),
                              SizedBox(
                                width: getWidth(15),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppString.PunchIn,
                                      style: PMT.style(0).copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(13))),
                                  SizedBox(
                                    height: getHeight(8),
                                  ),
                                  Obx(
                                    () => Text(
                                        controller.attendanceModel.isNotEmpty
                                            ? DateFormat(
                                                    'EEE, dd MMM yyyy hh:mm a')
                                                .format(controller
                                                        .attendanceModel
                                                        .first
                                                        .date ??
                                                    DateTime.now())
                                            : '',
                                        style: PMT.style(0).copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize: getFontSize(14))),
                                  ),
                                  SizedBox(
                                    height: getHeight(8),
                                  ),
                                  Obx(
                                    () => Text(
                                        'Todday ${PrefUtils.getString(PrefsKey.studentName)} is ${controller.attendanceModel.isNotEmpty && controller.attendanceModel.first.type != null ? controller.attendanceModel.first.type ?? '' : ''}',
                                        style: PMT.style(0).copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(13))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(45),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              color: ColorConstant.primaryWhite,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
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
                                    fontColor: ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            buildGridItem(
                              svgPath: ImageConstant.icFees,
                              label: AppString.fees,
                              onTap: () {},
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icLeave,
                              label: AppString.leave,
                              onTap: () {
                                Get.toNamed(AppRoutes.leaveDashboardScreenRout);
                              },
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icNotepad,
                              label: AppString.notePad,
                              onTap: () {
                                Get.toNamed(
                                    AppRoutes.noteBookSubjectScreenRout);
                              },
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icBus,
                              label: AppString.bus,
                              onTap: () {},
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icHomeWork,
                              label: AppString.homework,
                              onTap: () {
                                Get.toNamed(AppRoutes.homeWorkScreenRout);
                              },
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icLiveClass,
                              label: AppString.livClass,
                              onTap: () {},
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icMarks,
                              label: AppString.marks,
                              onTap: () {},
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icDiary,
                              label: AppString.dairy,
                              onTap: () {},
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icTimeTable,
                              label: AppString.timeTable,
                              onTap: () {
                                Get.toNamed(AppRoutes.timeTableScreenRout);
                              },
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icExam,
                              label: AppString.exam,
                              onTap: () {},
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icAttendance,
                              label: AppString.attendence,
                              onTap: () {},
                            ),
                            buildGridItem(
                              svgPath: ImageConstant.icDiary,
                              label: AppString.noticeBoard,
                              onTap: () {
                                Get.toNamed(AppRoutes.noticeBoardScreenRout);
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConstant.crimC7,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 10, top: 20, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Diwali',
                                      style: PMT.style(0).copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.bold,
                                          fontSize: getFontSize(14))),
                                  Row(
                                    children: [
                                      Text(
                                          'there will be no classes on 14th\nand will resume on 15th ',
                                          style: PMT.style(0).copyWith(
                                              color: ColorConstant.grey9A,
                                              fontWeight: FontWeight.bold,
                                              fontSize: getFontSize(13))),
                                      SizedBox(
                                        width: getWidth(10),
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.icSpeaker,
                                      ),
                                    ],
                                  ),
                                  Text('Read More',
                                      style: PMT.style(0).copyWith(
                                          color: ColorConstant.blueF9,
                                          fontWeight: FontWeight.bold,
                                          fontSize: getFontSize(12))),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /*Padding(
                          padding: const EdgeInsets.only(
<<<<<<<<< Temporary merge branch 1
                              left: 18, right: 18, bottom: 18, top: 10),
                          child: Row(
=========
                              left: 25, top: 25, right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
>>>>>>>>> Temporary merge branch 2
                            children: [
                              Text(
                                AppString.academics,
                                style: PMT.style(18,
                                    fontColor: ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: getHeight(30),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget buildGridItem(
      {String? svgPath, String? label, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: getHeight(50),
            width: getWidth(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: ColorConstant.blueFC.withOpacity(.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: CustomImageView(
                svgPath: svgPath,
              ),
            ),
          ),
          SizedBox(
            height: getHeight(6),
          ),
          Text(
            label!,
            style: PMT.style(15,
                fontColor: ColorConstant.grey9A, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
