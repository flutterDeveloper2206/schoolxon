import 'package:schoolxon/presentation/notification_screen/model/notification_model.dart';
import 'package:intl/intl.dart';
import '../../../core/app_export.dart';

class NotificationScreenController extends GetxController {
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  Rx<NotificationModel> notificationModel = NotificationModel().obs;
  @override
  onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getNotificationApi();
    });
    super.onInit();
  }

  String formatRelativeTimeOrDate(DateTime pastDate) {
    Duration difference = DateTime.now().difference(pastDate);

    if (difference.inDays >= 1) {
      return DateFormat('dd MMM, yyyy').format(pastDate);
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'just now';
    }
  }

  Future<void> getNotificationApi() async {
    isLoading.value = true;
    String schoolId = PrefUtils.getString(PrefsKey.selectSchoolId);
    String studentId = PrefUtils.getString(PrefsKey.studentID);

    try {
      await ApiService()
          .callGetApi(
              body: FormData({}),
              headerWithToken: false,
              showLoader: true,
              url: '${NetworkUrl.notificationUrl}${schoolId}/$studentId')
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
            notificationModel.value = NotificationModel.fromJson(value.body);
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
