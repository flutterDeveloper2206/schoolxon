import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calendar_view/calendar_view.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/common_appBar.dart';
import '../../core/app_export.dart';

class TimeTableScreen extends GetWidget {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    // Create a dummy EventController and add some events
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: ColorConstant.primaryBlue.withOpacity(.4),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: ColorConstant.primaryBlack),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    value: 'Monday',
                    icon: const Icon(Icons.arrow_drop_down, color: ColorConstant.primaryBlack),
                    dropdownColor: ColorConstant.whiteFB,
                    items: <String>['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: ColorConstant.primaryBlack, fontSize: 18),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle day change here
                    },
                    underline: Container(), // Hide the underline
                    isExpanded: true, // This makes the dropdown button take the full width of its parent
                  ),
                ),
              ],
            ),
          ),
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
                    return _buildTimeTableItem(
                      time: _formatTime(start),
                      subject: event.title ?? 'No Subject',
                      startTime: _formatTime(startTime),
                      endTime: _formatTime(endTime),
                      color: event.color ?? Colors.grey.shade300,
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    if (dateTime == null) {
      return 'No Time';
    }
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minutes $period';
  }

  Widget _buildTimeTableItem({
    required String time,
    required String subject,
    required String startTime,
    required String endTime,
    required Color color,
  }) {

    return Padding(
      padding: const EdgeInsets.only(top: 15,
      left: 15,right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$startTime To $endTime',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
