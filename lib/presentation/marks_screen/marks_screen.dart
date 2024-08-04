import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../core/app_export.dart';
import '../../widgets/common_appBar.dart';
import '../../widgets/custom_elavated_button.dart';
import 'controller/marks_screen_controller.dart';

class MarksScreen extends GetWidget<MarksScreenController> {
  const MarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0), // height of appbar
        child: CommonAppBar(
          title: AppString.marks,
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.openPopup.value = !controller.openPopup.value;
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstant.grey9e,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.greyD3.withOpacity(.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: getWidth(10)),
                            CustomImageView(
                              imagePath: ImageConstant.marksCalender,
                              height: getHeight(50),
                              width: getWidth(50),
                            ),
                            SizedBox(width: getWidth(20)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.pickDate,
                                  style: PMT.style(15,
                                      fontColor: ColorConstant.greyB4,
                                      fontWeight: FontWeight.bold),
                                ),
                                Obx(() => Text(
                                  controller.selectedDay.value,
                                  style: PMT.style(20,
                                      fontColor: ColorConstant.primaryBlack,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(),
                Obx(
                      () => ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.visibleItems.length,
                    itemBuilder: (context, index) {
                      final day = controller.visibleItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ExpansionWidget(
                          initiallyExpanded: false,
                         titleBuilder: (double animationValue, easeInValue,bool isExpanded, toggleFunction) {
                           return InkWell(
                             onTap: () => toggleFunction(animated: true),
                             child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20, right: 8, top: 8, bottom: 8),
                                       child: CustomImageView(
                                         svgPath: ImageConstant.icMarksFile,
                                       ),
                                     ),
                                     SizedBox(width: getWidth(10)),
                                     Expanded(
                                       child: Text(
                                         day,
                                         style: PMT.style(16,
                                             fontColor: ColorConstant.primaryBlack,
                                             fontWeight: FontWeight.w600),
                                       ),
                                     ),
                                   ],
                                 ),
                                isExpanded?
                                SizedBox.shrink(): Divider()
                               ],
                             ),
                           );
                         },
                          content: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('you have scored 335 marks ',style: PMT.style(14,
                                    fontColor: ColorConstant.green2D,
                                    fontWeight: FontWeight.bold)),
                                SizedBox(height: getHeight(10),),
                                Text('we will send you the link for parent  meeting if you have any doubt about '
                                    ' that meeting please contact us for  your assistance  ',style: PMT.style(15,
                                    fontColor: ColorConstant.grey9e,
                                    fontWeight: FontWeight.bold)),
                                SizedBox(height: getHeight(15),),
                                Text('Meet Info',style: PMT.style(18,
                                    fontColor: ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.bold),),
                                Text('Meet date oct 29, 2:59 PM  8 hours',style: PMT.style(16,
                                    fontColor: ColorConstant.grey9e,
                                    fontWeight: FontWeight.bold),),
                                SizedBox(height: getHeight(15),),
                                AppElevatedButton(
                                  buttonName: AppString.viewMarks,
                                  isDisable: true,
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),






              ],
            ),
          ),
          Obx(
                () => !controller.openPopup.value
                ? SizedBox.shrink()
                : Padding(
              padding: const EdgeInsets.only(top: 120, right: 20, left: 20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstant.greyD3,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: controller.daysOfWeek.map((String day) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            day,
                            style: PMT.style(16,
                                fontWeight: FontWeight.w700,
                                fontColor: ColorConstant.primaryBlack),
                          ),
                          onTap: () {
                            controller.selectedDay.value = day;
                            controller.openPopup.value = false;
                          },
                        ),
                        if (day != '2018') // Customize the condition as needed
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: ColorConstant.grey9D,
                          ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
