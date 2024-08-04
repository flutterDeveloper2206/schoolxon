import 'package:get/get.dart';

import '../../../packages/calender_view/src/event_controller.dart';
import '../../time_table_screen/model/time_table_model.dart';

class MarksScreenController extends GetxController {
  Rx<EventController> eventController = EventController().obs;
  RxString selectedDay = 'Monday'.obs;
  RxBool openPopup = false.obs;
  RxBool showContainer = true.obs;
  Rx<TimeTableModel> timeTableModel = TimeTableModel().obs;
  var visibleItems = [ 'Term results', 'Term i  results', 'Term iI  results', 'term iII  results'].obs;

  void hideItem(String day) {
    visibleItems.remove(day);
  }
  final List<String> daysOfWeek = [
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018'
  ];

}