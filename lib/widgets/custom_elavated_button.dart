import '../core/app_export.dart';
import '../core/utils/app_fonts.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';


class AppElevatedButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final Color? buttonShadowColor;
  final FontWeight? fontWeight;
  final double? radius;
  final bool? isLoading;
  final double? fontSize;
  final bool? showTextIcon;
  bool? hasGradient = true;
  final String? textIcon;
  final Color? borderColor;

  AppElevatedButton(
      {Key? key,
      required this.buttonName,
      required this.onPressed,
      this.textColor,
      this.textIcon,
      this.borderColor,
      this.fontWeight,
      this.fontSize,
      this.buttonColor,
      this.radius,
      this.showTextIcon,
      this.hasGradient = true,
      this.isLoading = false,
      this.buttonShadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getHeight(44),
      decoration: BoxDecoration(
        border: hasGradient ?? false
            ? null
            : Border.all(
                color: ColorConstant.primaryLightRed, width: getHeight(1)),
        color: buttonColor ?? ColorConstant.primaryRed,
        boxShadow: [
          BoxShadow(
              blurRadius: 10.0,
              offset: const Offset(4, 12),
              color: buttonShadowColor ?? ColorConstant.btnShadowColor),
        ],
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 50)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: buttonColor ?? ColorConstant.primaryRed,
          shadowColor: Colors.transparent,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 50))),
        ),
        child: !isLoading!
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 /* showTextIcon ?? false
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset(
                            textIcon ?? ImageConstant.icClose,
                            height: 23,
                          ),
                        )
                      : const SizedBox(),*/
                  Text(
                    buttonName.toString(),
                    style: PMT.style(
                      fontSize?.toInt() ?? 16,
                      fontColor: textColor ?? ColorConstant.primaryWhite,
                      fontWeight: fontWeight ?? FontWeight.w700,
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: getHeight(30),
                width: getHeight(30),
                child: const CircularProgressIndicator(
                  color: ColorConstant.primaryWhite,
                  strokeWidth: 2,
                )),
      ),
    );
  }
}
