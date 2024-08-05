import 'package:get/get.dart';
import 'package:schoolxon/presentation/marks_screen/Model/marks_model.dart';

import '../../../ApiServices/api_service.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/network_url.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../core/utils/string_constant.dart';
import '../../../packages/calender_view/src/event_controller.dart';
import '../../time_table_screen/model/time_table_model.dart';

class MarksScreenController extends GetxController {
  Rx<EventController> eventController = EventController().obs;
  RxString selectedDay = '2023'.obs;
  RxBool openPopup = false.obs;
  RxBool showContainer = true.obs;
  RxBool isLoading = false.obs;
  Rx<MarksModel> marksModel = MarksModel().obs;
  Rx<TimeTableModel> timeTableModel = TimeTableModel().obs;
  var visibleItems = [ 'Term results', 'Term i  results', 'Term iI  results', 'term iII  results'].obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMarksListApi();
    });
    super.onInit();
  }

  final List<String> daysOfWeek = [
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018'
  ];

  Future<void> getMarksListApi() async {
    isLoading.value = true;

    try {
      await ApiService()
          .callGetApi(
          body: FormData({}),
          headerWithToken: false,
          showLoader: true,
          url:
          '${NetworkUrl.marksUrl}705/342/20')
      // '${NetworkUrl.homeWorkDetailsUrl}${schoolId}/342/${homeWorkId}')
          .then((value) async {
        print('value.runtimeType == String ${value}');
        print('value.runtimeType == String ${value.statusCode}');
        if (value.runtimeType == String) {
          isLoading.value = false;

          ProgressDialogUtils.showTitleSnackBar(
              headerText: value.toString(), error: true);
        } else {
          if (value.statusCode == 200) {
            isLoading.value = false;
            marksModel.value =
                MarksModel.fromJson(value.body);
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

}