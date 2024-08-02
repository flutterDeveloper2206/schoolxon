import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:schoolxon/presentation/time_table_screen/controller/time_table_screen_controller.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../packages/calender_view/src/calendar_controller_provider.dart';
import '../../packages/calender_view/src/calendar_event_data.dart';
import '../../packages/calender_view/src/day_view/day_view.dart';
import '../../packages/calender_view/src/event_controller.dart';
import '../../widgets/common_appBar.dart';
import '../../core/app_export.dart';

class TimeTableScreen extends GetWidget<TimeTableScreenController> {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CommonAppBar(title: AppString.timeTable),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  controller.openPopup.value = !controller.openPopup.value;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  color: ColorConstant.primaryBlue.withOpacity(.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined,
                              color: ColorConstant.primaryBlack),
                          SizedBox(width: 8),
                          Obx(
                            () => Text(
                              controller.selectedDay.value,
                              style: PMT.appStyle(15),
                            ),
                          )
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_down,
                          color: ColorConstant.primaryBlack),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
                  child: Obx(
                    () => CalendarControllerProvider(
                      controller: controller.eventController.value,
                      child: DayView(
                        dayTitleBuilder: DayHeader.hidden,
                        minDay:
                            DateTime.now().subtract(const Duration(days: 30)),
                        maxDay: DateTime.now().add(const Duration(days: 30)),
                        initialDay: DateTime.now(),
                        heightPerMinute: 1.8,
                        startHour: 7,
                        verticalLineOffset: 0,
                        // timeLineBuilder: (date) {
                        //   return Text('${date.hour}');
                        // },
                        eventTileBuilder: (date, events, boundary, start, end) {
                          if (events.isNotEmpty) {
                            final event = events.first;
                            final startTime = event.startTime ?? DateTime.now();
                            final endTime = event.endTime ?? DateTime.now();
                            return controller.buildTimeTableItem(
                              time: controller.formatTime(start),
                              subject: event.title ?? 'No Subject',
                              startTime: controller.formatTime(startTime),
                              endTime: controller.formatTime(endTime),
                              color: event.color ?? Colors.grey.shade300,
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(
            () => !controller.openPopup.value
                ? SizedBox.shrink()
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 60, right: 20, left: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: ColorConstant.grey9D,
                                  blurRadius: 10,
                                  spreadRadius: 2)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView(
                          shrinkWrap: true,
                          children: controller.daysOfWeek.map((String day) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    day,
                                    style: PMT.appStyle(15),
                                  ),
                                  onTap: () {
                                    controller.selectedDay.value = day;
                                    controller.addEvent(day);
                                    controller.openPopup.value = false;
                                    // Navigator.pop(context);
                                  },
                                ),
                                if (day != 'Sunday')
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: ColorConstant.grey9D,
                                  )
                              ],
                            );
                          }).toList(),
                        )),
                  ),
          ),
        ],
      ),
    );
  }
}
