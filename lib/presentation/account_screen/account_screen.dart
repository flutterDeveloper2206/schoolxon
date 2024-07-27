import 'package:flutter/material.dart';
import 'package:schoolxon/presentation/account_screen/widget/account_common_listTile.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
import 'package:schoolxon/widgets/common_appBar.dart';

import '../../core/app_export.dart';
import 'controller/account_screen_controller.dart';

class AccountScreen extends GetWidget<AccountScreenController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(title: AppString.account)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(25),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgPerson,
                        height: getHeight(64),
                        width: getHeight(64),
                      )),
                  SizedBox(
                    width: getWidth(15),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'vignesh',
                        style: PMT.style(18,
                            fontWeight: FontWeight.w600,
                            fontColor: ColorConstant.blackOF),
                      ),
                      SizedBox(
                        height: getHeight(5),
                      ),
                      Row(
                        children: [
                          Text(
                            'ID NO: ',
                            style: PMT.style(16,
                                fontColor: ColorConstant.textGray78),
                          ),
                          Text(
                            '18UBA980',
                            style: PMT.style(16,
                                fontColor: ColorConstant.textGray78),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(25),
              ),
              AccountCommonListTile(
                icon: ImageConstant.icProfile,
                title: AppString.myProfile,
              ),
              AccountCommonListTile(
                icon: ImageConstant.icPassword,
                title: AppString.password,
              ),
              AccountCommonListTile(
                icon: ImageConstant.icFile,
                title: AppString.tHistory,
              ),
              AccountCommonListTile(
                icon: ImageConstant.icHelp,
                title: AppString.support,
                onTap: () {
                  Get.toNamed(AppRoutes.contactSupportScreenRoute);
                },
              ),
              SizedBox(
                height: getHeight(45),
              ),
              Text(
                AppString.legal,
                style: PMT.appStyle(19, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: getHeight(15),
              ),
              const AccountCommonListTile(
                title: AppString.termsAndService,
              ),
              const AccountCommonListTile(
                title: AppString.privacyPolicy,
              ),
              SizedBox(
                height: getHeight(35),
              ),
              Bounce(
                onTap: () {},
                child: Row(
                  children: [
                    CustomImageView(svgPath: ImageConstant.icLogout),
                    SizedBox(
                      width: getWidth(15),
                    ),
                    Text(
                      AppString.logOut,
                      style: PMT.style(
                        18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
