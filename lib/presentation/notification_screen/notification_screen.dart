import 'package:get/get.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
import 'package:schoolxon/widgets/common_appBar.dart';
import 'controller/notification_screen_controller.dart';

class NotificationScreen extends GetWidget<NotificationScreenController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0), // height of appbar
          child: CommonAppBar(title: AppString.notification)),
      body: Obx(
        () => controller.notificationModel.value.notice != null &&
                controller.notificationModel.value.notice!.isEmpty
            ? Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(50)),
                  child: CustomImageView(
                    imagePath: ImageConstant.imageNoticeBoardEmpty,
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getHeight(16),
                    ),
                    // Row(
                    //   children: [
                    //     Obx(
                    //       () => Bounce(
                    //         onTap: () {
                    //           controller.index.value = 0;
                    //         },
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //               border: Border.all(
                    //                   color: controller.index.value == 0
                    //                       ? ColorConstant.primaryBlue
                    //                       : ColorConstant.grey81.withOpacity(0.5)),
                    //               borderRadius: BorderRadius.circular(20),
                    //               color: controller.index.value == 0
                    //                   ? ColorConstant.primaryBlue.withOpacity(0.2)
                    //                   : ColorConstant.primaryWhite),
                    //           padding: EdgeInsets.symmetric(
                    //               horizontal: getWidth(22), vertical: getHeight(5)),
                    //           child: Text(
                    //             AppString.all,
                    //             style: PMT.appStyle(15,
                    //                 fontColor: controller.index.value == 0
                    //                     ? ColorConstant.primaryBlue
                    //                     : ColorConstant.grey81,
                    //                 fontWeight: FontWeight.w600),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: getWidth(15),
                    //     ),
                    //     Obx(
                    //       () => Bounce(
                    //         onTap: () {
                    //           controller.index.value = 1;
                    //         },
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //               border: Border.all(
                    //                   color: controller.index.value == 1
                    //                       ? ColorConstant.primaryBlue
                    //                       : ColorConstant.grey81.withOpacity(0.5)),
                    //               borderRadius: BorderRadius.circular(20),
                    //               color: controller.index.value == 1
                    //                   ? ColorConstant.primaryBlue.withOpacity(0.2)
                    //                   : ColorConstant.primaryWhite),
                    //           padding: EdgeInsets.symmetric(
                    //               horizontal: getWidth(22), vertical: getHeight(5)),
                    //           child: Text(
                    //             AppString.thisMonth,
                    //             style: PMT.appStyle(15,
                    //                 fontColor: controller.index.value == 1
                    //                     ? ColorConstant.primaryBlue
                    //                     : ColorConstant.grey81,
                    //                 fontWeight: FontWeight.w600),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: getHeight(16),
                    // ),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            controller.notificationModel.value.notice?.length ??
                                0,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                                      .notificationModel
                                                      .value
                                                      .notice?[index]
                                                      .title
                                                      ?.isEmpty ==
                                                  true
                                              ? 'Title'
                                              : controller
                                                      .notificationModel
                                                      .value
                                                      .notice?[index]
                                                      .title ??
                                                  'Title',
                                          style: PMT.appStyle(16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: getHeight(5),
                                        ),
                                        Text(
                                          controller
                                                  .notificationModel
                                                  .value
                                                  .notice?[index]
                                                  .notification ??
                                              '',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: PMT.appStyle(14,
                                              fontColor: ColorConstant.grey71),
                                        ),
                                        SizedBox(
                                          height: getHeight(5),
                                        ),
                                        Text(
                                          controller.formatRelativeTimeOrDate(
                                              controller
                                                      .notificationModel
                                                      .value
                                                      .notice?[index]
                                                      .createdBy ??
                                                  DateTime.now()),
                                          style: PMT.appStyle(13,
                                              fontColor: ColorConstant.greyB8),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: getWidth(20),
                                  ),
                                  CustomImageView(
                                    height: getHeight(65),
                                    width: getHeight(65),
                                    radius: BorderRadius.circular(18),
                                    imagePath: ImageConstant.imgTestNoticeBoard,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(20),
                              ),
                              Container(
                                height: 1,
                                color: ColorConstant.greyDD,
                              ),
                              SizedBox(
                                height: getHeight(15),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
