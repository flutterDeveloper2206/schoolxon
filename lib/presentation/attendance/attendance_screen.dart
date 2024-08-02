import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:schoolxon/packages/horizontal_week_calendar.dart';
import 'package:schoolxon/presentation/attendance/controller/attendance_screen_controller.dart';
import '../../core/app_export.dart';
import '../../core/utils/app_prefs_key.dart';
import '../../core/utils/pref_utils.dart';
import '../../widgets/common_appBar.dart';

class AttendanceScreen extends GetWidget<AttendanceScreenController> {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0), // height of appbar
          child: CommonAppBar(title: AppString.Attendance)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18, left: 18, top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppString.Timesheet,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.w800,
                      fontSize: getFontSize(16)),
                ),
              ],
            ),
          ),
          SizedBox(height: getHeight(20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(15)),
                  color: ColorConstant.blueColor42),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
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
                                  ? DateFormat('EEE, dd MMM yyyy hh:mm a')
                                      .format(controller
                                              .attendanceModel.first.date ??
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
          Divider(height: 60, color: ColorConstant.whiteFB, thickness: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppString.Overallstatics,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(16)),
                ),
              ],
            ),
          ),
          SizedBox(height: getHeight(20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: HorizontalWeekCalendar(
              monthColor: Colors.black,
              inactiveBackgroundColor: Colors.white,
              inactiveTextColor: Colors.grey,
              activeBackgroundColor: ColorConstant.blueC5,
              borderRadius: BorderRadius.circular(15),
              initialDate: DateTime.now(), monthFormat: 'MMMM yyyy',
              minDate: DateTime(2022, 1, 1),

              maxDate: DateTime.now().add(Duration(days: 365)),
              // Set the inactive border color to green
            ),
          ),
          Divider(height: 50, color: ColorConstant.whiteFB, thickness: 10),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.attendanceModel.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorConstant.whiteFB,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 5),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: getHeight(12),
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.icPin,
                                        height: getHeight(20),
                                        width: getWidth(20),
                                      ),
                                      SizedBox(
                                        height: getHeight(22),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: ColorConstant.primaryWhite),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: Text(
                                            DateFormat('dd EEE').format(
                                                controller
                                                        .attendanceModel[index]
                                                        .date ??
                                                    DateTime.now()),
                                            // controller
                                            //     .attendanceModel[index].date
                                            //     .toString(),
                                            style: PMT.style(0).copyWith(
                                                color:
                                                    ColorConstant.primaryBlack,
                                                fontWeight: FontWeight.w400,
                                                fontSize: getFontSize(14)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: getHeight(5),
                                      ),
                                    ],
                                  ),
                                )),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat('dd EEE').format(controller
                                              .attendanceModel[index].date ??
                                          DateTime.now()),
                                      style: PMT.style(0).copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: getFontSize(14)),
                                    ),
                                    SizedBox(height: getHeight(15)),

                                    ///Absent
                                    /* Column(
                                    children: [
                                      Text('* Vignesh Is Absent Today',
                                        style: PMT.style(0).copyWith(
                                            color: ColorConstant.darkredColor4A,
                                            fontWeight: FontWeight.w500,
                                            fontSize: getFontSize(14)),
                                      ),
                                    ],
                                  ),*/
                                    ///Not Absent
                                    Obx(
                                      () => controller.attendanceModel[index]
                                                  .attendenceTypeId !=
                                              '1'
                                          ? Text(
                                              controller.status(controller
                                                  .attendanceModel[index]
                                                  .attendenceTypeId),
                                              style: PMT.style(0).copyWith(
                                                  color:
                                                      ColorConstant.primaryBlue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(14)),
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                    Obx(
                                      () => controller.attendanceModel[index]
                                                      .attendenceTypeId ==
                                                  '1' &&
                                              controller.attendanceModel[index]
                                                      .punchtime !=
                                                  null
                                          ? Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      AppString.Punchin,
                                                      style: PMT
                                                          .style(0)
                                                          .copyWith(
                                                              color:
                                                                  ColorConstant
                                                                      .grey9e,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize:
                                                                  getFontSize(
                                                                      13)),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.circle_sharp,
                                                          size: 10,
                                                          color: Colors
                                                              .greenAccent,
                                                        ),
                                                        SizedBox(
                                                            width: getWidth(5)),
                                                        Text(
                                                          DateFormat('hh:mm a')
                                                              .format(controller
                                                                      .attendanceModel[
                                                                          index]
                                                                      .punchtime ??
                                                                  DateTime
                                                                      .now()),
                                                          // controller
                                                          //         .attendanceModel[
                                                          //             index]
                                                          //         .punchtime ??
                                                          //     '',
                                                          style: PMT.style(0).copyWith(
                                                              color: ColorConstant
                                                                  .primaryBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  getFontSize(
                                                                      14)),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(width: getWidth(40)),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      AppString.Punchout,
                                                      style: PMT
                                                          .style(0)
                                                          .copyWith(
                                                              color:
                                                                  ColorConstant
                                                                      .grey9e,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize:
                                                                  getFontSize(
                                                                      13)),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.circle_sharp,
                                                          size: 10,
                                                          color: Colors
                                                              .orangeAccent,
                                                        ),
                                                        SizedBox(
                                                            width: getWidth(5)),
                                                        Text(
                                                          DateFormat('hh:mm a')
                                                              .format(controller
                                                                      .attendanceModel[
                                                                          index]
                                                                      .exittime ??
                                                                  DateTime
                                                                      .now()),
                                                          style: PMT.style(0).copyWith(
                                                              color: ColorConstant
                                                                  .primaryBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  getFontSize(
                                                                      14)),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                          height: 40,
                          color: ColorConstant.greyE4,
                          thickness: 1),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
