import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CommonAppBar extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final double? elevation;
  final List<Widget>? actions;
  final void Function()? onTapBack;
  final void Function()? onPressedAction;
  const CommonAppBar(
      {super.key,
      this.title,
      this.onTapBack,
      this.onPressedAction,
      this.backgroundColor,
      this.elevation,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor ?? ColorConstant.primaryWhite,
      surfaceTintColor: ColorConstant.primaryWhite,
      elevation: elevation ?? 1.2,
      shadowColor: ColorConstant.appBarShadow,
      title: title != null
          ? Text(
              title ?? '',
              style: PMT.appStyle(18, fontWeight: FontWeight.w600),
            )
          : null,
      actions: actions,
      leading: InkWell(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        onTap: onTapBack ??
            () {
              Get.back();
            },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
              height: getHeight(5),
              width: getHeight(5),
              child: CustomImageView(
                svgPath: ImageConstant.icBack,
              )),
        ),
      ),
    );
  }
}
