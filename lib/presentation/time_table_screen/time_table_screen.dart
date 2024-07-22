import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:calendar_view/calendar_view.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/common_appBar.dart';
import 'controller/time_table_screen_controller.dart';

class TimeTableScreen extends GetWidget<TimeTableScreenController> {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0), // height of appbar
        child: CommonAppBar(title: AppString.timeTable),
      ),
      body: CalendarControllerProvider(
        controller: EventController(),
        child: DayView(
          // Customize the WeekView as needed
          eventTileBuilder: (date, events, boundary, start, end) {
            return events.isNotEmpty
                ?   Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blue,
              child: const Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Monday',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            )
                : Container();
          },
          minDay: DateTime.now().subtract(const Duration(days: 30)),
          maxDay: DateTime.now().add(const Duration(days: 30)),
          initialDay: DateTime.now(),
          heightPerMinute: 0.1,

        ),
      ),
    );
  }
}


