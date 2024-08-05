import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.timeTableList.length,
                    itemBuilder: (context, index) {
                      return controller.buildTimeTableItem(
                        name: controller.timeTableList[index].name ?? '',
                        roomNo: controller.timeTableList[index].roomNo ?? '',
                        subject: controller.timeTableList[index].subjectName ??
                            'No Subject',
                        startTime: controller.formatTime(
                            controller.stringToDateTime(
                                controller.timeTableList[index].startTime)),
                        endTime: controller.formatTime(
                            controller.stringToDateTime(
                                controller.timeTableList[index].endTime)),
                        color: controller.randomColor().withOpacity(0.2),
                      );
                    },
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
