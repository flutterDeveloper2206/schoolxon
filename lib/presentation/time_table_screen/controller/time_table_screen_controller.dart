import 'package:intl/intl.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/common_constant.dart';
import 'package:schoolxon/presentation/time_table_screen/model/time_table_model.dart';

import '../../../packages/calender_view/src/calendar_event_data.dart';
import '../../../packages/calender_view/src/event_controller.dart';
import 'dart:math' as math;

class TimeTableScreenController extends GetxController {
  RxBool isLoading = false.obs;

  RxString selectedDay = 'Monday'.obs;
  RxBool openPopup = false.obs;
  Rx<TimeTableModel> timeTableModel = TimeTableModel().obs;
  RxList<Day> timeTableList = <Day>[].obs;

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

  List<Color> colorList = [
    Color(0xffE4FAFF),
    Color(0xffFEE4FF),
    Color(0xffBDC8EE),
    Color(0xffFFDE90),
    Color(0xff92E2A3),
  ];
  // eventController.value.add(
  // CalendarEventData(
  // date: DateTime.now(),
  // startTime: stringToDateTime(
  // timeTableModel.value.timetable!.monday![i].startTime),
  // endTime: stringToDateTime(
  // timeTableModel.value.timetable!.monday![i].endTime),
  // title:
  // timeTableModel.value.timetable!.monday![i].subjectName ?? '',
  // color: randomColor().withOpacity(0.2),
  // ),
  void addEvent(String day) {
    if (timeTableModel.value.timetable != null) {
      timeTableList.clear();
      if (day == 'Monday') {
        timeTableList.addAll(timeTableModel.value.timetable!.monday!);
      } else if (day == 'Tuesday') {
        timeTableList.addAll(timeTableModel.value.timetable!.tuesday!);
      } else if (day == 'Wednesday') {
        timeTableList.addAll(timeTableModel.value.timetable!.wednesday!);
      } else if (day == 'Thursday') {
        timeTableList.addAll(timeTableModel.value.timetable!.thursday!);
      } else if (day == 'Friday') {
        timeTableList.addAll(timeTableModel.value.timetable!.friday!);
      } else if (day == 'Saturday') {
        timeTableList.addAll(timeTableModel.value.timetable!.saturday!);
      } else if (day == 'Sunday') {
        timeTableList.addAll(timeTableModel.value.timetable!.sunday!);
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
            await CommonConstant.instance.getFcmToken();
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
    required String name,
    required String roomNo,
    required String subject,
    required String startTime,
    required String endTime,
    required Color color,
  }) {
    return Padding(
      padding:
          EdgeInsets.only(top: 15, left: getWidth(16), right: getWidth(16)),
      child: Container(
        child: Row(
          children: [
            Container(
              width: getWidth(110),
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFB3B3B3),
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 2.0), // shadow direction: bottom right
                  )
                ],
                color: ColorConstant.primaryBlack,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${startTime}',
                      style: PMT.appStyle(15,
                          fontWeight: FontWeight.w600,
                          fontColor: ColorConstant.primaryWhite),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '$endTime',
                      style: PMT.appStyle(15,
                          fontWeight: FontWeight.w600,
                          fontColor: ColorConstant.primaryWhite),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: colorList[math.Random().nextInt(5)],
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFB3B3B3),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      // blurStyle: BlurStyle.outer,
                      offset:
                          Offset(0.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9.5),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(subject,
                                style: PMT.appStyle(15.5,
                                    fontColor: ColorConstant.grey54,
                                    fontWeight: FontWeight.w600)),
                            Text('$name', style: PMT.appStyle(13)),
                          ],
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                              color: ColorConstant.primaryYellow,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'Room No: ${roomNo}',
                            style: PMT.appStyle(9,
                                fontColor: ColorConstant.primaryWhite),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getHeight(7),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
