import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class LeaveDashBoardScreenController extends GetxController {
  RxDouble currentLeaves = 4.0.obs; // Initial number of leaves taken
  RxDouble totalLeaves = 12.0.obs; // Total available leaves

  final List<Leave> leaveHistory = [
    Leave(
        type: 'Medical Appointments', date: 'Wed, 16 Dec', status: 'Approved'),
    Leave(
        type: 'Medical Appointments', date: 'Wed, 17 Dec', status: 'Rejected'),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
}

class Leave {
  final String type;
  final String date;
  final String status;

  Leave({required this.type, required this.date, required this.status});
}
