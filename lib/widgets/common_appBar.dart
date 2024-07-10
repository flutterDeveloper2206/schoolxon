import '../core/app_export.dart';

class CommonAppBar extends StatelessWidget {
  final String? title;
  final void Function()? onTapBack;
  const CommonAppBar({super.key, this.title, this.onTapBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorConstant.primaryWhite,
      surfaceTintColor: ColorConstant.primaryWhite,
      elevation: 1.2,
      shadowColor: ColorConstant.appBarShadow,
      title: title != null
          ? Text(
              title ?? '',
              style: PMT.appStyle(18, fontWeight: FontWeight.w600),
            )
          : null,
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
