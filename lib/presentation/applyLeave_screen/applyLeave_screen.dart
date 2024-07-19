import 'package:dotted_border/dotted_border.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/widgets/custom_elavated_button.dart';
import 'controller/applyLeave_screen_controller.dart';

class ApplyLeaveScreen extends GetWidget<ApplyLeaveScreenController> {
  const ApplyLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    // State management for selected dates
    final Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
    final Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);

    Future<void> _selectDate(
        BuildContext context, Rx<DateTime?> selectedDate) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate.value ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null) {
        selectedDate.value = pickedDate;
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.close,
                  color: ColorConstant.primaryBlack,
                  size: 30,
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Text(
                  AppString.leaveApplication,
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(20)),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: controller.selectSickLeave,
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: controller.sickLeaveBorderColor),
                            borderRadius: BorderRadius.circular(10),
                            color: controller.sickLeaveColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            child: Text(
                              AppString.sickLeave,
                              style: PMT.style(0).copyWith(
                                    color: controller.sickLeaveTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getFontSize(14),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: controller.selectCasualLeave,
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: controller.casualLeaveBorderColor),
                            borderRadius: BorderRadius.circular(10),
                            color: controller.casualLeaveColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                            child: Text(
                              AppString.casualLeave,
                              style: PMT.style(0).copyWith(
                                    color: controller.casualLeaveTextColor,
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
                  height: getHeight(20),
                ),
                Text(
                  'Not Well Today !!!',
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(12)),
                ),
                const Divider(
                    height: 40, color: ColorConstant.greyE4, thickness: 2),
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
                            _selectDate(context, selectedStartDate);
                          },
                          child: Obx(() => Row(
                                children: [
                                  Text(
                                    selectedStartDate.value != null
                                        ? '${selectedStartDate.value!.month}/${selectedStartDate.value!.day}/${selectedStartDate.value!.year}'
                                        : 'May 7, 2018',
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
                                    color: ColorConstant.blueF9,
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
                            _selectDate(context, selectedEndDate);
                          },
                          child: Obx(() => Row(
                                children: [
                                  Text(
                                    selectedEndDate.value != null
                                        ? '${selectedEndDate.value!.month}/${selectedEndDate.value!.day}/${selectedEndDate.value!.year}'
                                        : 'May 7, 2018',
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
                                    color: ColorConstant.blueF9,
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
                  height: getHeight(12),
                ),
                Text(
                  'Dear Sir,\n'
                  'I Am Not Feeling Well Today So I Wont Able To Come Today. Kindly Grant Me A Leave, Thanks',
                  style: PMT.style(0).copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(12)),
                ),
                const Divider(
                    height: 40, color: ColorConstant.greyE4, thickness: 2),
                SizedBox(
                  height: getHeight(12),
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
                                                      color: Colors.blue,
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
                  () => controller.selectedImage.value != null
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
                                                color:
                                                    ColorConstant.primaryBlack,
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
                                        const Icon(
                                          Icons.close,
                                          color: ColorConstant.primaryBlack,
                                          size: 24,
                                        ),
                                        Text(
                                          '${(controller.progress.value * 100).toStringAsFixed(0)}%',
                                          style: PMT.style(0).copyWith(
                                                color: ColorConstant.grey7A,
                                                fontWeight: FontWeight.bold,
                                                fontSize: getFontSize(12),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getHeight(15),
                                ),
                                LinearProgressIndicator(
                                  value: controller.progress.value,
                                  minHeight: 6.0,
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blueAccent),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ),
                SizedBox(
                  height: getHeight(40),
                ),
                AppElevatedButton(
                  buttonName: AppString.applyLeave,
                  onPressed: () {},
                  buttonColor: ColorConstant.blueColor42,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
