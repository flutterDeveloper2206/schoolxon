import 'package:dotted_border/dotted_border.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
import 'package:schoolxon/widgets/common_appBar.dart';
import 'package:schoolxon/widgets/custom_elavated_button.dart';
import 'controller/applyLeave_screen_controller.dart';

class ApplyLeaveScreen extends GetWidget<ApplyLeaveScreenController> {
  const ApplyLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    // State management for selected dates

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(
              title: AppString.applyLeave,
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
                  AppString.leaveApplication,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(20)),
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Bounce(
                      onTap: () {
                        controller.selectCasualLeave(0);
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: controller.isSickLeaveSelected.value == 0
                                    ? ColorConstant.transparent
                                    : ColorConstant.greyE4),
                            borderRadius: BorderRadius.circular(10),
                            color: controller.isSickLeaveSelected.value == 0
                                ? ColorConstant.primaryBlue.withOpacity(.1)
                                : Colors.transparent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            child: Text(
                              AppString.sickLeave,
                              style: PMT.style(0).copyWith(
                                    color:
                                        controller.isSickLeaveSelected.value ==
                                                0
                                            ? ColorConstant.blueColor42
                                            : ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getFontSize(14),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Bounce(
                      onTap: () {
                        controller.selectCasualLeave(1);
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: controller.isSickLeaveSelected.value == 1
                                    ? ColorConstant.transparent
                                    : ColorConstant.greyE4),
                            borderRadius: BorderRadius.circular(10),
                            color: controller.isSickLeaveSelected.value == 1
                                ? ColorConstant.primaryBlue.withOpacity(.1)
                                : Colors.transparent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                            child: Text(
                              AppString.casualLeave,
                              style: PMT.style(0).copyWith(
                                    color:
                                        controller.isSickLeaveSelected.value ==
                                                1
                                            ? ColorConstant.blueColor42
                                            : ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getFontSize(14),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(20),
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
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppString.enterSubject,
                      hintStyle: PMT.appStyle(14)),
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
                        InkWell(
                          onTap: () {
                            controller.selectDate(
                                context, controller.selectedStartDate);
                          },
                          child: Obx(() => Row(
                                children: [
                                  Text(
                                    controller.selectedStartDate.value != null
                                        ? '${controller.selectedStartDate.value!.month}/${controller.selectedStartDate.value!.day}/${controller.selectedStartDate.value!.year}'
                                        : 'Select Date',
                                    style: PMT.style(0).copyWith(
                                        color: ColorConstant.primaryBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: getFontSize(13)),
                                  ),
                                  SizedBox(
                                    width: getWidth(50),
                                  ),
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    color: ColorConstant.primaryBlue,
                                  )
                                ],
                              )),
                        ),
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
                        InkWell(
                          onTap: () {
                            controller.selectDate(
                                context, controller.selectedEndDate);
                          },
                          child: Obx(() => Row(
                                children: [
                                  Text(
                                    controller.selectedEndDate.value != null
                                        ? '${controller.selectedEndDate.value!.month}/${controller.selectedEndDate.value!.day}/${controller.selectedEndDate.value!.year}'
                                        : 'Select Date',
                                    style: PMT.style(0).copyWith(
                                        color: ColorConstant.primaryBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: getFontSize(13)),
                                  ),
                                  SizedBox(
                                    width: getWidth(50),
                                  ),
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    color: ColorConstant.primaryBlue,
                                  )
                                ],
                              )),
                        ),
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
                  height: getHeight(12),
                ),
                InkWell(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: DottedBorder(
                        padding: const EdgeInsets.all(20),
                        color: Colors.grey,
                        strokeWidth: 3,
                        dashPattern: [5, 4],
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Obx(() {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.selectedImage.value != null
                                    ? Image.file(
                                        controller.selectedImage.value!,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : Column(
                                        children: [
                                          Icon(
                                            Icons.file_upload_outlined,
                                            color: Colors.black,
                                            size: 40,
                                          ),
                                          RichText(
                                            text: const TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Choose Your File ',
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryBlue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                TextSpan(
                                                  text: ' To Upload',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Text(
                                            'Img Or Doc',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Obx(
                  () {
                    return controller.selectedImage.value != null &&
                            controller.progress.value < 1.8
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConstant.greyE4.withOpacity(0.4),
                            ),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomImageView(
                                        svgPath: ImageConstant.icPdf,
                                        height: getHeight(35),
                                        width: getWidth(35),
                                      ),
                                      SizedBox(width: getWidth(20)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.selectedImage.value!.path
                                                .split('/')
                                                .last,
                                            style: PMT.style(0).copyWith(
                                                  color: ColorConstant
                                                      .primaryBlack,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: getFontSize(13),
                                                ),
                                          ),
                                          Text(
                                            '${(controller.selectedImage.value!.lengthSync() / 1024).toStringAsFixed(0)} KB',
                                            style: PMT.style(0).copyWith(
                                                  color: ColorConstant.grey7A,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: getFontSize(12),
                                                ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.removeImage();
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: ColorConstant.primaryBlack,
                                              size: 24,
                                            ),
                                          ),
                                          (controller.progress.value * 100)
                                                      .toStringAsFixed(0) ==
                                                  '100'
                                              ? SizedBox.shrink()
                                              : Text(
                                                  '${(controller.progress.value * 100).toStringAsFixed(0)}%',
                                                  style: PMT.style(0).copyWith(
                                                        color: ColorConstant
                                                            .grey7A,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            getFontSize(12),
                                                      ),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getHeight(15),
                                  ),
                                  (controller.progress.value * 100)
                                              .toStringAsFixed(0) ==
                                          '100'
                                      ? SizedBox.shrink()
                                      : LinearProgressIndicator(
                                          value: controller.progress.value,
                                          minHeight: 6.0,
                                          backgroundColor: Colors.white,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            ColorConstant.primaryBlue,
                                          ),
                                        ),
                                  (controller.progress.value * 100)
                                              .toStringAsFixed(0) ==
                                          '100'
                                      ? SizedBox.shrink()
                                      : SizedBox(height: 10),
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink();
                  },
                ),
                SizedBox(
                  height: getHeight(40),
                ),
                Obx(
                  () => AppElevatedButton(
                    buttonName: AppString.applyLeave,
                    onPressed: () {
                      controller.next();
                    },
                    isLoading: controller.isUpdateLoading.value,
                    buttonColor: ColorConstant.yellow39,
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
