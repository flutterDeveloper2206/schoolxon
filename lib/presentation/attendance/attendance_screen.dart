import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolxon/presentation/attendance/controller/attendance_screen_controller.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';

import '../../core/app_export.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/common_appBar.dart';

class AttendanceScreen extends GetWidget<AttendanceScreenController> {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0), // height of appbar
          child: CommonAppBar(title: AppString.Attendance)),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppString.Timesheet,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(18)),
                ),
              ],
            ),
            SizedBox(height: getHeight(20)),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
                  color: ColorConstant.blueColor42),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Icon(
                        Icons.watch_later_outlined,
                        weight: 1.1,
                        color: ColorConstant.greenColor7D,
                        size: 35,
                      ),
                    ),
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
                        Text('Wed, 11th Mar 2019 10.00 AM',
                            style: PMT.style(0).copyWith(
                                color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: getFontSize(14))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 60, color: ColorConstant.whiteFB, thickness: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppString.Overallstatics,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(18)),
                ),
              ],
            ),
            SizedBox(height: getHeight(20)),
            HorizontalWeekCalendar(
              monthColor: Colors.black,
              inactiveBackgroundColor: Colors.white,
              inactiveTextColor: Colors.grey,
              activeBackgroundColor: ColorConstant.blueC5,
              borderRadius: BorderRadius.circular(12),
              initialDate: DateTime.now(),
              minDate: DateTime(2022, 1, 1),
              maxDate: DateTime.now().add(Duration(days: 365)),
              // Set the inactive border color to green
            ),
            Divider(height: 60, color: ColorConstant.whiteFB, thickness: 10),
            Container(height:getHeight(100),width: getWidth(70),color: Colors.grey,
                child:CustomImageView(svgPath: ImageConstant.icPin,height: getHeight(20),width: getWidth(20),))
          ],
        ),
      ),
    );
  }
}
