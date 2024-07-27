import 'package:flutter/material.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
import 'package:schoolxon/presentation/account_screen/widget/account_common_listTile.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
import 'package:schoolxon/widgets/common_appBar.dart';

import '../../core/app_export.dart';
import 'controller/account_screen_controller.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountScreenController controller = Get.put(AccountScreenController());
  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(20),
              ),
              Center(
                child: Text(
                  AppString.profile,
                  style: PMT.style(20,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.blackOF),
                ),
              ),
              SizedBox(
                height: getHeight(25),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgPerson,
                              height: getHeight(50),
                              width: getHeight(50),
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
                              height: getHeight(2),
                            ),
                            Row(
                              children: [
                                Text(
                                  AppString.schoolId,
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
                            SizedBox(
                              height: getHeight(2),
                            ),
                            Row(
                              children: [
                                Text(
                                  AppString.className,
                                  style: PMT.style(16,
                                      fontColor: ColorConstant.textGray78),
                                ),
                                Text(
                                  'Basic 3',
                                  style: PMT.style(16,
                                      fontColor: ColorConstant.textGray78),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.icEditProfile,
                          height: getHeight(25),
                          width: getHeight(25),
                        ),
                        SizedBox(
                          height: getHeight(3),
                        ),
                        Text(
                          AppString.editProfile,
                          style: PMT.style(16,
                              fontColor: ColorConstant.textGray78),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(25),
              ),
              AccountCommonListTile(
                icon: ImageConstant.icAddAccount,
                title: AppString.addAccount,
                subTitle: AppString.addNewAccountText,
              ),
              AccountCommonListTile(
                icon: ImageConstant.icSwitchAccount,
                title: AppString.switchAccount,
                subTitle: AppString.addNewAccountText,
              ),
              AccountCommonListTile(
                icon: ImageConstant.icNotification,
                title: AppString.notifications,
                subTitle: AppString.notificationOn,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.switchValue.value =
                          !controller.switchValue.value;
                    });
                  },
                  child: Container(
                    width: getWidth(70),
                    height: getHeight(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: controller.switchValue.value
                          ? ColorConstant.primaryBlue
                          : Colors.grey,
                    ),
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          left: controller.switchValue.value ? 50.0 : 3.0,
                          right: controller.switchValue.value ? 3.0 : 50.0,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 5,
                          child: Text(
                            'OFF',
                            style: TextStyle(
                              color: controller.switchValue.value
                                  ? Colors.transparent
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 5,
                          child: Text(
                            'ON',
                            style: TextStyle(
                              color: controller.switchValue.value
                                  ? Colors.white
                                  : Colors.transparent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AccountCommonListTile(
                icon: ImageConstant.icSetting,
                title: AppString.setting,
                subTitle: AppString.appSetting,
              ),
              AccountCommonListTile(
                onTap: () {
                  showExitDialogs(context);
                },
                icon: ImageConstant.icLogOutRight,
                title: AppString.logOut,
                subTitle: AppString.endYourSession,
              ),
              SizedBox(
                height: getHeight(45),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showExitDialogs(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: getHeight(70),
                        width: getHeight(70),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: ColorConstant.greyD9,
                            borderRadius: BorderRadius.circular(100)),
                        child: CustomImageView(
                            imagePath: ImageConstant.icLogOutRight)),
                    SizedBox(height: 10.0),
                    Text(
                      AppString.logOut,
                      style: PMT.appStyle(
                        15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(30)),
                      child: Text(
                        AppString.logOutText,
                        textAlign: TextAlign.center,
                        style:
                            PMT.appStyle(12, fontColor: ColorConstant.grey9D),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstant.greyF1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(AppString.cancel,
                                  style: PMT.appStyle(12,
                                      fontColor: ColorConstant.grey9D)),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstant.primaryRed,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                AppString.logOut,
                                style: PMT.appStyle(12,
                                    fontColor: ColorConstant.primaryWhite),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }
}
