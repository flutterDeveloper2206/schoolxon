import 'package:schoolxon/presentation/leave_dashboard_screen/widgets/leave_card.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/common_appBar.dart';
import 'package:schoolxon/widgets/custom_elavated_button.dart';
import '../../core/app_export.dart';
import 'controller/leave_dashboard_screen_controller.dart';

class LeaveDashBoardScreen extends GetWidget<LeaveDashBoardScreenController> {
  const LeaveDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(title: AppString.leaveInfo)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(25),
              ),
              Obx(
                () => Text(
                  '${controller.getGreeting()}, ${controller.loginData.value.student?.username ?? ''}',
                  style: PMT.appStyle(14, fontColor: ColorConstant.textGray6D),
                ),
              ),
              SizedBox(
                height: getHeight(8),
              ),
              Text(
                AppString.leaveDashboard,
                style: PMT.appStyle(18,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.blackOF),
              ),
              SizedBox(
                height: getHeight(15),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       '${controller.currentLeaves.toInt()} ${AppString.leaves}',
              //       style: PMT.appStyle(
              //         14,
              //       ),
              //     ),
              //     Text(
              //       '${controller.totalLeaves.toInt()} ${AppString.leaves}',
              //       style: PMT.appStyle(
              //         14,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: getHeight(6)),
              // LinearProgressIndicator(
              //   value: controller.currentLeaves.value /
              //       controller.totalLeaves.value,
              //   borderRadius: BorderRadius.circular(28),
              //   backgroundColor: ColorConstant.greyF4,
              //   color: ColorConstant.green2D,
              //   minHeight: 6.0,
              // ),
              SizedBox(height: getHeight(25)),
              AppElevatedButton(
                buttonColor: ColorConstant.yellow39,
                buttonName: AppString.applyLeaves,
                onPressed: () {
                  Get.toNamed(AppRoutes.applyLeaveScreenRout);
                },
              ),
              SizedBox(
                height: getHeight(55),
              ),
              Text(
                AppString.leaveHistory,
                style: PMT.appStyle(18),
              ),
              SizedBox(
                height: getHeight(16),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount:
                        controller.allLeaveList.value.results?.length ?? 0,
                    itemBuilder: (context, index) {
                      return LeaveCard(
                          leave: controller.allLeaveList.value.results![index]);
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
