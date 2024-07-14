import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
import 'package:schoolxon/routes/app_routes.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/custom_app_text_form_field.dart';
import '../../widgets/custom_elavated_button.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/language_select_controller.dart';

class LanguageSelectScreen extends GetWidget<LanguageSelectScreenController> {
  const LanguageSelectScreen({super.key});

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
                      child: Icon(
                        Icons.close,
                        size: 25,
                      )),
                ),
              ),
              SizedBox(height: getHeight(30)),
              CustomImageView(
                svgPath: ImageConstant.imgAlphaLogo,
                height: 75,
                width: double.infinity,
              ),
              SizedBox(
                height: getHeight(30),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: Text(
                  "choose your preferred language",
                  style: PMT.style(20).copyWith(
                      color: ColorConstant.black,
                      fontWeight: FontWeight.w800,
                      fontSize: getFontSize(20)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 18.0, right: 18.0, top: 5.0),
                child: Text(
                  "your feed will be served basis on your selection",
                  style: PMT.style(13).copyWith(
                      color: ColorConstant.GreyTextColor,
                      fontWeight: FontWeight.w200,
                      fontSize: getFontSize(13)),
                ),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.languages.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        activeColor: ColorConstant.primaryBlue,
                        title: Text(
                          controller.languages[index]['name'],
                          style: TextStyle(
                            color: ColorConstant.primaryBlack,
                          ),
                        ),
                        value: controller.languages[index]['isSelected'],
                        onChanged: (bool? value) {
                          controller.onItemSelect(index);
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: AppElevatedButton(
                  buttonName: AppString.next,
                  radius: 8.0,
                  buttonColor: ColorConstant.blueTextColor,
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.homeScreenRout);
                  },
                ),
              ),
              SizedBox(height: getHeight(10)),
            ],
          ),
        ));
  }
}
