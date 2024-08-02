import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../core/app_export.dart';
import '../../widgets/common_appBar.dart';
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
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstant.grey9e,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.greyD3.withOpacity(.2)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: getWidth(10),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.marksCalender,
                      height: getHeight(50),
                      width: getWidth(50),
                    ),
                    SizedBox(
                      width: getWidth(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.pickDate,
                          style: PMT.style(15,
                              fontColor: ColorConstant.greyB4,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          AppString.chooseDate,
                          style: PMT.style(20,
                              fontColor: ColorConstant.primaryBlack,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
