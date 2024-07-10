import 'package:flutter/material.dart';
import 'package:schoolxon/presentation/account_screen/widget/account_common_listTile.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
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
            child: CommonAppBar(title: AppString.contactSupport)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(25),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Text(
                  AppString.needHelp,
                  style: PMT.style(18,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.blackOF),
                ),
              ),
              SizedBox(
                height: getHeight(8),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Text(
                  AppString.needHelpText,
                  style: PMT.style(17, fontColor: ColorConstant.textGray6D),
                ),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Container(
                height: 4,
                color: ColorConstant.dividerGreyE1,
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Text(
                  AppString.contactForm,
                  style: PMT.style(16,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.blackOF),
                ),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Container(
                height: 1,
                color: ColorConstant.dividerGreyE1,
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.name,
                      style: PMT.style(16, fontColor: ColorConstant.textGray6D),
                    ),
                    SizedBox(
                      height: getHeight(40),
                      child: TextFormField(
                        style: PMT.style(16,
                            fontWeight: FontWeight.w600,
                            fontColor: ColorConstant.blackOF),
                        decoration: InputDecoration(
                          hintText: AppString.enterName,
                          hintStyle: PMT.style(16,
                              fontColor: ColorConstant.textGray6D),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: ColorConstant.dividerGreyE1,
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.email,
                      style: PMT.style(16, fontColor: ColorConstant.textGray6D),
                    ),
                    SizedBox(
                      height: getHeight(40),
                      child: TextFormField(
                        style: PMT.style(16,
                            fontWeight: FontWeight.w600,
                            fontColor: ColorConstant.blackOF),
                        decoration: InputDecoration(
                          hintStyle: PMT.style(16,
                              fontColor: ColorConstant.textGray6D),
                          hintText: AppString.enterEmail,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: ColorConstant.dividerGreyE1,
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.subject,
                      style: PMT.style(16, fontColor: ColorConstant.textGray6D),
                    ),
                    SizedBox(
                      height: getHeight(40),
                      child: TextFormField(
                        style: PMT.style(16,
                            fontWeight: FontWeight.w600,
                            fontColor: ColorConstant.blackOF),
                        decoration: InputDecoration(
                          hintStyle: PMT.style(16,
                              fontColor: ColorConstant.textGray6D),
                          hintText: AppString.enterSubject,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: ColorConstant.dividerGreyE1,
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Text(
                  AppString.message,
                  style: PMT.style(16,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.blackOF),
                ),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: TextFormField(
                  cursorColor: ColorConstant.primaryBlack,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintStyle:
                        PMT.style(16, fontColor: ColorConstant.textGray6D),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: AppString.helpYou,
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: AppElevatedButton(
                  buttonName: AppString.sendMessage,
                  isDisable: true,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ));
  }
}
