import 'package:dotted_border/dotted_border.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/presentation/leave_details_screen/controller/leave_details_screen_controller.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
import 'package:schoolxon/widgets/common_appBar.dart';
import 'package:schoolxon/widgets/custom_elavated_button.dart';

class LeaveDetailsScreen extends GetWidget<LeaveDetailsScreenController> {
  const LeaveDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(
              title: AppString.leaveDetails,
              elevation: 0,
            )),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  AppString.leaveDetails,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(20)),
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                Text(
                  AppString.subject,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.grey7A,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(17)),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                TextFormField(
                  controller: controller.subjectController,
                  readOnly: true,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintStyle: PMT.appStyle(14)),
                ),
                Container(
                  height: 2,
                  color: ColorConstant.greyE4,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.startDate,
                          style: PMT.style(0).copyWith(
                              color: ColorConstant.grey7A,
                              fontWeight: FontWeight.bold,
                              fontSize: getFontSize(13)),
                        ),
                        SizedBox(
                          height: getHeight(14),
                        ),
                        Obx(() => Text(
                              controller.selectedStartDate.value != null
                                  ? '${controller.selectedStartDate.value!.month}/${controller.selectedStartDate.value!.day}/${controller.selectedStartDate.value!.year}'
                                  : 'Select Date',
                              style: PMT.style(0).copyWith(
                                  color: ColorConstant.primaryBlack,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getFontSize(13)),
                            )),
                        SizedBox(
                          height: getHeight(14),
                        ),
                        Container(
                          width: getWidth(150),
                          height: getWidth(2),
                          color: ColorConstant.greyE4,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.endDate,
                          style: PMT.style(0).copyWith(
                              color: ColorConstant.grey7A,
                              fontWeight: FontWeight.bold,
                              fontSize: getFontSize(13)),
                        ),
                        SizedBox(
                          height: getHeight(14),
                        ),
                        Obx(() => Text(
                              controller.selectedEndDate.value != null
                                  ? '${controller.selectedEndDate.value!.month}/${controller.selectedEndDate.value!.day}/${controller.selectedEndDate.value!.year}'
                                  : 'Select Date',
                              style: PMT.style(0).copyWith(
                                  color: ColorConstant.primaryBlack,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getFontSize(13)),
                            )),
                        SizedBox(
                          height: getHeight(14),
                        ),
                        Container(
                          width: getWidth(150),
                          height: getWidth(2),
                          color: ColorConstant.greyE4,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Text(
                  AppString.description,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.grey7A,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(17)),
                ),
                SizedBox(
                  height: getHeight(5),
                ),
                TextFormField(
                  maxLines: 4,
                  readOnly: true,
                  controller: controller.descriptionController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppString.enterDes,
                      hintStyle: PMT.appStyle(14)),
                ),
                Container(
                  height: 2,
                  color: ColorConstant.greyE4,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  AppString.attachments,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.grey7A,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(17)),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.greyE4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: getHeight(40),
                          width: getWidth(40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorConstant.primaryBlue.withOpacity(.2)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: CustomImageView(
                              color: ColorConstant.primaryBlue,
                              svgPath: ImageConstant.icClip,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getWidth(15),
                        ),
                        Text(
                          // 'Read Ch. 16.1 - 16.2,\nEx A1 - A5',
                          'Document {index + 1}',
                          style: PMT.style(15,
                              fontColor: ColorConstant.grey9A,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.file_download_outlined,
                          color: ColorConstant.primaryBlue,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(40),
                ),
                Obx(
                  () => AppElevatedButton(
                    buttonName: AppString.deleteLeave,
                    onPressed: () {
                      controller.next();
                    },
                    isLoading: controller.isUpdateLoading.value,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
