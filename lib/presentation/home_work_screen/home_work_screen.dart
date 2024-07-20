import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:schoolxon/presentation/home_work_screen/controller/home_work_screen_controller.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';

import '../../core/app_export.dart';

class HomeWorkScreen extends GetWidget<HomeWorkScreenController> {
  const HomeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.primaryBlue,
          body: Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: ColorConstant.primaryBlue.withOpacity(.7),
              child: Padding(
                padding: EdgeInsets.only(top: getHeight(10)),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                                  Icons.arrow_back,
                                  size: 30,
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
                              padding: const EdgeInsets.all(20),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getHeight(5),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              color: ColorConstant.primaryWhite),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 40,
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Text(
                                      'Home Works For You',
                                      style: PMT.style(16,
                                          fontColor: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Obx(
                                      () => ListView.builder(
                                        itemCount: controller.homeWorkModelList
                                                .value.homeworklist?.length ??
                                            0,
                                        itemBuilder: (context, index) {
                                          return Bounce(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRoutes
                                                      .homeWorkDetailScreenRout,
                                                  arguments: [
                                                    {
                                                      "homeWorkID": controller
                                                              .homeWorkModelList
                                                              .value
                                                              .homeworklist?[
                                                                  index]
                                                              .id ??
                                                          '',
                                                    },
                                                  ]);
                                            },
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 18, left: 18),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: getHeight(20),
                                                      ),
                                                      Text(
                                                        controller
                                                                .homeWorkModelList
                                                                .value
                                                                .homeworklist?[
                                                                    index]
                                                                .subjectName ??
                                                            '',
                                                        style: PMT.style(19,
                                                            fontColor:
                                                                ColorConstant
                                                                    .primaryBlack,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(5),
                                                      ),
                                                      Text(
                                                        'Home Work ',
                                                        // 'Home Work | Assignment | Test',
                                                        style: PMT.style(14,
                                                            fontColor:
                                                                ColorConstant
                                                                    .grey9A,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: getHeight(15),
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
                                                      Html(
                                                          shrinkWrap: true,
                                                          data: controller
                                                                  .homeWorkModelList
                                                                  .value
                                                                  .homeworklist?[
                                                                      index]
                                                                  .description ??
                                                              ''),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: getHeight(20),
                                                ),
                                                Divider(
                                                    height: 20,
                                                    color: ColorConstant.greyF3,
                                                    thickness: 5),
                                              ],
                                            ),
                                          );
                                        },
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
              ))),
    );
  }
}
