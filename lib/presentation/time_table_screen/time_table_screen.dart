import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:schoolxon/presentation/time_table_screen/controller/time_table_screen_controller.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/common_appBar.dart';
import '../../core/app_export.dart';

class TimeTableScreen extends GetWidget <TimeTableScreenController> {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    final EventController eventController = EventController();

    // Example events to simulate calendar events
    eventController.add(
      CalendarEventData(
        date: DateTime.now(),
        startTime: DateTime.now().copyWith(hour: 1, minute: 0),
        endTime: DateTime.now().copyWith(hour: 1, minute: 30),
        title: 'Task at 1 AM',
        color: Colors.red.shade100,
      ),
    );
    eventController.add(
      CalendarEventData(
        date: DateTime.now(),
        startTime: DateTime.now().copyWith(hour: 2, minute: 0),
        endTime: DateTime.now().copyWith(hour: 2, minute: 30),
        title: 'Hindi',
        color: Colors.orange.shade100,
      ),
    );
    eventController.add(
      CalendarEventData(
        date: DateTime.now(),
        startTime: DateTime.now().copyWith(hour: 3, minute: 0),
        endTime: DateTime.now().copyWith(hour: 3, minute: 30),
        title: 'Hindi',
        color: Colors.orange.shade100,
      ),
    );
    eventController.add(
      CalendarEventData(
        date: DateTime.now(),
        startTime: DateTime.now().copyWith(hour: 4, minute: 0),
        endTime: DateTime.now().copyWith(hour: 4, minute: 30),
        title: 'Hindi',
        color: Colors.orange.shade100,
      ),
    );

    return Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CommonAppBar(title: AppString.timeTable),
      ),
      body: Column(
        children: [
          Expanded(
            child: CalendarControllerProvider(
              controller: eventController,
              child: DayView(
                dayTitleBuilder: DayHeader.hidden,
                minDay: DateTime.now().subtract(const Duration(days: 30)),
                maxDay: DateTime.now().add(const Duration(days: 30)),
                initialDay: DateTime.now(),
                heightPerMinute: 2.5,
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
        ],
      ),
    );
  }


}
