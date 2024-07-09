import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
import 'package:schoolxon/presentation/login_screen/controller/login_screen_controller.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/custom_app_text_form_field.dart';
import '../../widgets/custom_elavated_button.dart';
import '../forgetPwd_screen/forgetPwd_screen.dart';

class LoginScreen extends StatelessWidget {
  var loginScreenController = Get.find<LoginScreenController>();

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
                      child: Icon(Icons.arrow_back,size: 25,)),
                ) ,

              ),

              Obx(()=>
              loginScreenController.isCorrect.value == true ?
              Container(
                padding: EdgeInsets.all(10.0),
                height: 72,color: ColorConstant.darkredColor,
              child:
              Row(
                children: [
                  const Icon(Icons.info_outline,color: ColorConstant.primaryWhite,),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                      child: Text(
                        "check that the information entered is correct",
                        style: PMT.style(15).copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w800,
                            fontSize: getFontSize(15)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              )
                  : Container(),),
              SizedBox(height: getHeight(30),),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                child: Text(
                  AppString.LOGINACC,
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
                  AppString.LOGINWLCMTEXT,
                  style: PMT.style(14).copyWith(
                      color: ColorConstant.black,
                      fontWeight: FontWeight.w200,
                      fontSize: getFontSize(14)
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
              SizedBox(height: getHeight(10)),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                child: Text(
                  "Password",
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
                    isObscureText : true,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(ForgetPwdScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "forget password",
                      style: PMT.style(15).copyWith(
                          color: ColorConstant.blueTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: getFontSize(15)
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              AppElevatedButton(
                buttonName: 'Submit',
                  radius: 8.0,
                  buttonColor: ColorConstant.blueTextColor,
                onPressed: () {
                  loginScreenController.isCorrect.value = ! loginScreenController.isCorrect.value;
                },),
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
