import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
import 'package:schoolxon/presentation/home_work_screen/controller/home_work_screen_controller.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';

import '../../core/app_export.dart';
import '../../packages/homework_calendar_.dart';
import '../../packages/horizontal_week_calendar.dart';
import '../../widgets/common_appBar.dart';

class HomeWorkScreen extends GetWidget<HomeWorkScreenController> {
  const HomeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(
              title: AppString.homework,
            )),
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Obx(
            () => controller.isLoading.value
                ? SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getHeight(20),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                        child: HomeWorkCalendar(
                          monthColor: Colors.black,
                          inactiveBackgroundColor: Colors.white,

                          inactiveTextColor: Colors.black.withOpacity(0.8),
                          activeBackgroundColor: ColorConstant.blueC5,
                          borderRadius: BorderRadius.circular(6),
                          initialDate: DateTime.now(),
                          minDate: DateTime(2022, 1, 1),
                          onDateChange: (p1) {
                            print(controller.selectSubjectID.value);
                            controller.selectDate.value = p1;
                            if (controller.selectSubjectID.value != '0') {
                              controller.allHomeWorkList.clear();
                              controller.allHomeWorkList.value = controller
                                  .getHomeWorkList
                                  .where((p0) =>
                                      controller.selectDate.value.compareTo(
                                              p0.homeworkDate ??
                                                  DateTime.now()) ==
                                          0 &&
                                      p0.subjectId ==
                                          controller.selectSubjectID.value)
                                  .toList();
                            } else {
                              controller.allHomeWorkList.value =
                                  controller.getHomeWorkList;
                            }
                          },
                          maxDate: DateTime.now().add(Duration(days: 365)),
                          // Set the inactive border color to green
                        ),
                      ),
                      SizedBox(
                        height: getHeight(30),
                      ),
                      SizedBox(
                        height: getHeight(30),
                        child: Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.subjectsList.length ?? 0,
                            padding:
                                EdgeInsets.symmetric(horizontal: getWidth(16)),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Bounce(
                                  onTap: () {
                                    controller.selectedIndex.value = index;
                                    controller.selectSubjectID.value =
                                        controller.subjectsList[index]
                                                .subjectId ??
                                            '';

                                    if (controller.selectSubjectID.value !=
                                        '0') {
                                      controller.allHomeWorkList.value =
                                          controller.getHomeWorkList
                                              .where((p0) =>
                                                  controller.selectDate.value
                                                          .compareTo(
                                                              p0.homeworkDate ??
                                                                  DateTime
                                                                      .now()) ==
                                                      0 &&
                                                  p0.subjectId ==
                                                      controller.selectSubjectID
                                                          .value)
                                              .toList();
                                    } else {
                                      controller.allHomeWorkList.value =
                                          controller.getHomeWorkList;
                                    }
                                  },
                                  child: Obx(
                                    () => Column(
                                      children: [
                                        Text(
                                          controller.subjectsList[index].name ??
                                              '',
                                          style: PMT.style(16,
                                              fontColor: controller
                                                          .selectedIndex
                                                          .value ==
                                                      index
                                                  ? ColorConstant.primaryBlue
                                                  : ColorConstant.primaryBlack,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: getHeight(5),
                                        ),
                                        Container(
                                          height: getHeight(4),
                                          width: getWidth(45),
                                          color:
                                              controller.selectedIndex.value ==
                                                      index
                                                  ? ColorConstant.primaryBlue
                                                  : ColorConstant.transparent,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(40),
                      ),
                      Obx(
                        () => controller.allHomeWorkList.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 200),
                                  child: Text('No Data Found'),
                                ),
                              )
                            : Expanded(
                                child: Obx(
                                  () => ListView.builder(
                                    itemCount:
                                        controller.allHomeWorkList.length ?? 0,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getWidth(10)),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Bounce(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes
                                                    .homeWorkDetailScreenRout,
                                                arguments: [
                                                  {
                                                    "homeWorkID": controller
                                                            .allHomeWorkList[
                                                                index]
                                                            .id ??
                                                        '',
                                                  },
                                                ]);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: ColorConstant
                                                        .primaryBlue
                                                        .withOpacity(0.2))),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: getWidth(12),
                                                vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          controller
                                                                  .allHomeWorkList[
                                                                      index]
                                                                  .subjectName ??
                                                              '',
                                                          style: PMT.style(17,
                                                              fontColor:
                                                                  ColorConstant
                                                                      .primaryBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                        // SizedBox(
                                                        //   height: getHeight(5),
                                                        // ),
                                                        Text(
                                                          '${controller.checkGender(controller.allHomeWorkList[index].createdBy?.gender ?? '')} ${controller.allHomeWorkList[index].createdBy?.name ?? ''}',
                                                          style: PMT.style(14,
                                                              fontColor:
                                                                  ColorConstant
                                                                      .grey9D,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${AppString.due} :',
                                                          style: PMT.style(14,
                                                              fontColor:
                                                                  ColorConstant
                                                                      .primaryBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                        Text(
                                                          controller.formatRelativeTimeOrDate(
                                                              controller
                                                                      .allHomeWorkList[
                                                                          index]
                                                                      .homeworkDate ??
                                                                  DateTime
                                                                      .now()),
                                                          style: PMT.style(13,
                                                              fontColor:
                                                                  ColorConstant
                                                                      .grey9D,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(
                                                  height: getHeight(5),
                                                ),
                                                // Container(
                                                //   decoration: BoxDecoration(
                                                //     borderRadius:
                                                //         BorderRadius
                                                //             .circular(5),
                                                //     color: ColorConstant
                                                //         .blueFC
                                                //         .withOpacity(.4),
                                                //   ),
                                                //   child: Padding(
                                                //     padding:
                                                //         const EdgeInsets
                                                //             .symmetric(
                                                //             horizontal: 10,
                                                //             vertical: 5),
                                                //     child: Row(
                                                //       mainAxisSize:
                                                //           MainAxisSize.min,
                                                //       children: [
                                                //         CustomImageView(
                                                //           svgPath:
                                                //               ImageConstant
                                                //                   .icBook,
                                                //           height:
                                                //               getHeight(15),
                                                //           width:
                                                //               getWidth(15),
                                                //         ),
                                                //         SizedBox(
                                                //           width:
                                                //               getWidth(10),
                                                //         ),
                                                //         Text(
                                                //           'Read Ch. 16.1 - 16.2, Ex A1 - A5',
                                                //           style: PMT.style(
                                                //               13,
                                                //               fontColor:
                                                //                   ColorConstant
                                                //                       .blueF9,
                                                //               fontWeight:
                                                //                   FontWeight
                                                //                       .bold),
                                                //         ),
                                                //       ],
                                                //     ),
                                                //   ),
                                                // ),
                                                // Divider(
                                                //     height: 40,
                                                //     color: ColorConstant
                                                //         .blueFC
                                                //         .withOpacity(.4),
                                                //     thickness: 1),
                                                // Text(
                                                //   'If Need Any Help Ping Me On Chat I Will Help You',
                                                //   style: PMT.style(14,
                                                //       fontColor:
                                                //           ColorConstant
                                                //               .grey9A,
                                                //       fontWeight:
                                                //           FontWeight.bold),
                                                // ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: getHeight(35),
                                                      width: 3,
                                                      color: ColorConstant
                                                          .primaryBlue,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                                maxHeight:
                                                                    getHeight(
                                                                        50)),
                                                        child: Html(
                                                            shrinkWrap: true,
                                                            data: controller
                                                                    .homeWorkModelList
                                                                    .value
                                                                    .homeworklist?[
                                                                        index]
                                                                    .description ??
                                                                ''),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
