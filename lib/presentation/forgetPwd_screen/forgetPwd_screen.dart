import 'package:flutter/cupertino.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
import 'package:schoolxon/presentation/language_select_screen/language_select_screen.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/custom_app_text_form_field.dart';
import '../../widgets/custom_elavated_button.dart';

class ForgetPwdScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.close,size: 25,)),
                ) ,

              ),

              SizedBox(height: getHeight(30),),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                child: Text(
                  AppString.FORGETPWD,
                  style: PMT.style(20).copyWith(
                      color: ColorConstant.black,
                      fontWeight: FontWeight.w800,
                      fontSize: getFontSize(20)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 5.0),
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
                      fontSize: getFontSize(15)
                  ),
                ),
              ),
              SizedBox(height: getHeight(20),),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                child: Text(
                  "User Name",
                  style: PMT.style(15).copyWith(
                      color: ColorConstant.GreyDarkTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: getFontSize(15)
                  ),
                ),
              ),
              Container(
                height: 46,
                padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                margin: const EdgeInsets.only(top: 10.0),
                child: CustomAppTextFormField(
                  shape: TextFormFieldShape.RoundedBorder6,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                child: AppElevatedButton(
                  buttonName: 'Request Password',
                  radius: 8.0,
                  buttonColor: ColorConstant.blueTextColor,
                  onPressed: () {
                    Get.to(LanguageSelectScreen());
                               },),
              ),
              SizedBox(height: getHeight(10)),
              Center(
                child: RichText(
                  text:  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Clicking This button You Agree To The ',
                        style: PMT.style(12).copyWith(
                            color: ColorConstant.textGreyColor,
                            fontWeight: FontWeight.w400,
                            fontSize: getFontSize(12)
                        ),
                      ),
                      TextSpan(
                        text: ' Terms ',
                        style: PMT.style(12).copyWith(
                            color: ColorConstant.blueTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: getFontSize(12)
                        ),
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
