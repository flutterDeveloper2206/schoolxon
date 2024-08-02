import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:schoolxon/presentation/time_table_screen/model/time_table_model.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/utils/app_prefs_key.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../core/utils/string_constant.dart';
import '../../../packages/calender_view/src/calendar_event_data.dart';
import '../../../packages/calender_view/src/event_controller.dart';
import 'dart:math' as math;

class TimeTableScreenController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<EventController> eventController = EventController().obs;
  RxString selectedDay = 'Monday'.obs;
  RxBool openPopup = false.obs;
  Rx<TimeTableModel> timeTableModel = TimeTableModel().obs;

  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getTimeTableListApi();
    });

    // TODO: implement onInit
    super.onInit();
  }

  DateTime stringToDateTime(timeString) {
    if (timeString == null) {
      return DateTime.now();
    }
    {
      return DateFormat("HH:mm:ss").parse(timeString);
    }
  }

  Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  void addEvent(String day) {
    if (timeTableModel.value.timetable != null) {
      if (day == 'Monday') {
        for (var i = 0;
            i < timeTableModel.value.timetable!.monday!.length;
            i++) {
          eventController.value.add(
            CalendarEventData(
              date: DateTime.now(),
              startTime: stringToDateTime(
                  timeTableModel.value.timetable!.monday![i].startTime),
              endTime: stringToDateTime(
                  timeTableModel.value.timetable!.monday![i].endTime),
              title:
                  timeTableModel.value.timetable!.monday![i].subjectName ?? '',
              color: randomColor().withOpacity(0.2),
            ),
          );
        }
      } else if (day == 'Tuesday') {
        for (var i = 0;
            i < timeTableModel.value.timetable!.tuesday!.length;
            i++) {
          eventController.value = EventController();
          eventController.value.add(
            CalendarEventData(
              date: DateTime.now(),
              startTime: stringToDateTime(
                  timeTableModel.value.timetable!.tuesday![i].startTime),
              endTime: stringToDateTime(
                  timeTableModel.value.timetable!.tuesday![i].endTime),
              title:
                  timeTableModel.value.timetable!.tuesday![i].subjectName ?? '',
              color: randomColor().withOpacity(0.2),
            ),
          );
        }
      } else if (day == 'Wednesday') {
        eventController.value = EventController();

        for (var i = 0;
            i < timeTableModel.value.timetable!.wednesday!.length;
            i++) {
          eventController.value.add(
            CalendarEventData(
              date: DateTime.now(),
              startTime: stringToDateTime(
                  timeTableModel.value.timetable!.wednesday![i].startTime),
              endTime: stringToDateTime(
                  timeTableModel.value.timetable!.wednesday![i].endTime),
              title:
                  timeTableModel.value.timetable!.wednesday![i].subjectName ??
                      '',
              color: randomColor().withOpacity(0.2),
            ),
          );
        }
      } else if (day == 'Thursday') {
        eventController.value = EventController();

        for (var i = 0;
            i < timeTableModel.value.timetable!.thursday!.length;
            i++) {
          eventController.value.add(
            CalendarEventData(
              date: DateTime.now(),
              startTime: stringToDateTime(
                  timeTableModel.value.timetable!.thursday![i].startTime),
              endTime: stringToDateTime(
                  timeTableModel.value.timetable!.thursday![i].endTime),
              title: timeTableModel.value.timetable!.thursday![i].subjectName ??
                  '',
              color: randomColor().withOpacity(0.2),
            ),
          );
        }
      } else if (day == 'Friday') {
        eventController.value = EventController();

        for (var i = 0;
            i < timeTableModel.value.timetable!.friday!.length;
            i++) {
          eventController.value.add(
            CalendarEventData(
              date: DateTime.now(),
              startTime: stringToDateTime(
                  timeTableModel.value.timetable!.friday![i].startTime),
              endTime: stringToDateTime(
                  timeTableModel.value.timetable!.friday![i].endTime),
              title:
                  timeTableModel.value.timetable!.friday![i].subjectName ?? '',
              color: randomColor().withOpacity(0.2),
            ),
          );
        }
      } else if (day == 'Saturday') {
        eventController.value = EventController();

        for (var i = 0;
            i < timeTableModel.value.timetable!.saturday!.length;
            i++) {
          eventController.value.add(
            CalendarEventData(
              date: DateTime.now(),
              startTime: stringToDateTime(
                  timeTableModel.value.timetable!.saturday![i].startTime),
              endTime: stringToDateTime(
                  timeTableModel.value.timetable!.saturday![i].endTime),
              title: timeTableModel.value.timetable!.saturday![i].subjectName ??
                  '',
              color: randomColor().withOpacity(0.2),
            ),
          );
        }
      } else if (day == 'Sunday') {
        eventController.value = EventController();

        for (var i = 0;
            i < timeTableModel.value.timetable!.sunday!.length;
            i++) {
          eventController.value.add(
            CalendarEventData(
              date: DateTime.now(),
              startTime: stringToDateTime(
                  timeTableModel.value.timetable!.sunday![i].startTime),
              endTime: stringToDateTime(
                  timeTableModel.value.timetable!.sunday![i].endTime),
              title:
                  timeTableModel.value.timetable!.sunday![i].subjectName ?? '',
              color: randomColor().withOpacity(0.2),
            ),
          );
        }
      }
    }
  }

  Future<void> getTimeTableListApi() async {
    isLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    try {
      await ApiService()
          .callGetApi(
              body: FormData({}),
              headerWithToken: false,
              showLoader: true,
              url: '${NetworkUrl.timeTableUrl}${schoolId}/${studentId}')
          // url: '${NetworkUrl.getStudentByIdUrl}${schoolId}/$studentId')
          .then((value) async {
        if (value.runtimeType == String) {
          isLoading.value = false;

          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (value.statusCode == 200) {
            isLoading.value = false;
            timeTableModel.value = TimeTableModel.fromJson(value.body);
            addEvent('Monday');
            update();
          } else {
            isLoading.value = false;

            ProgressDialogUtils.showTitleSnackBar(
                headerText: AppString.something, error: true);
          }
        }
      });
    } catch (error) {
      isLoading.value = false;

      ProgressDialogUtils.showTitleSnackBar(
          headerText: AppString.something, error: true);
    }
  }

  String formatTime(DateTime dateTime) {
    if (dateTime == null) {
      return 'No Time';
    }
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minutes $period';
  }

  Widget buildTimeTableItem({
    required String time,
    required String subject,
    required String startTime,
    required String endTime,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
