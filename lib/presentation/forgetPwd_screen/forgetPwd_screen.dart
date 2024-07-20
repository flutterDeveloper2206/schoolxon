import 'package:flutter/cupertino.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
import 'package:schoolxon/presentation/forgetPwd_screen/controller/forgetPwd_screen_controller.dart';
import 'package:schoolxon/presentation/language_select_screen/language_select_screen.dart';
import 'package:schoolxon/widgets/common_appBar.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/custom_app_text_form_field.dart';
import '../../widgets/custom_elavated_button.dart';

class ForgetPwdScreen extends GetWidget<ForgetPwdScreenController> {
  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(
              title: AppString.forgetPassword,
              elevation: 0,
            )),
        body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(30),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: Text(
                  AppString.FORGETPWD,
                  style: PMT.style(20).copyWith(
                      color: ColorConstant.black,
                      fontWeight: FontWeight.w800,
                      fontSize: getFontSize(20)),
                ),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 18.0, right: 18.0, top: 5.0),
                child: Text(
                  "To request permission to reset a password,"
                  " you should reach out to the owner of the "
                  "account or the person in charge of managing"
                  " passwords for your organization. This can "
                  "typically be done through email or by speaking to "
                  "them directly.",
                  style: PMT.style(15).copyWith(
                      color: ColorConstant.GreyTextColor,
                      fontWeight: FontWeight.w200,
                      fontSize: getFontSize(15)),
                ),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: Text(
                  "User Name",
                  style: PMT.style(15).copyWith(
                      color: ColorConstant.GreyDarkTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: getFontSize(15)),
                ),
              ),
              Container(
                height: 46,
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                margin: const EdgeInsets.only(top: 10.0),
                child: CustomAppTextFormField(
                  shape: TextFormFieldShape.RoundedBorder6,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: AppElevatedButton(
                  buttonName: 'Request Password',
                  radius: 8.0,
                  buttonColor: ColorConstant.primaryBlue,
                  onPressed: () {
                    Get.to(LanguageSelectScreen());
                  },
                ),
              ),
              SizedBox(height: getHeight(10)),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Clicking This button You Agree To The ',
                        style: PMT.style(12).copyWith(
                            color: ColorConstant.textGreyColor,
                            fontWeight: FontWeight.w400,
                            fontSize: getFontSize(12)),
                      ),
                      TextSpan(
                        text: ' Terms ',
                        style: PMT.style(12).copyWith(
                            color: ColorConstant.primaryBlue.withOpacity(.9),
                            fontWeight: FontWeight.w400,
                            fontSize: getFontSize(12)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getHeight(10)),
            ],
          ),
        ));
  }
}
