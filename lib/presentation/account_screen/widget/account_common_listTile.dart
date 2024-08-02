import 'package:schoolxon/widgets/bouncing_button.dart';

import '../../../core/app_export.dart';

class AccountCommonListTile extends StatelessWidget {
  final String? icon;
  final String title;
  final String subTitle;
  final Widget? child;
  final void Function()? onTap;
  const AccountCommonListTile(
      {super.key,
      this.icon,
      this.child,
      required this.title,
      required this.subTitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.only(bottom: getHeight(14)),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFB3B3B3),
                  // blurRadius: 2.0,
                  spreadRadius: 0.0,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0.0, 2.0), // shadow direction: bottom right
                )
              ],
              color: ColorConstant.primaryWhite,
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(
              horizontal: getWidth(20), vertical: getHeight(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (icon != null)
                    Container(
                        width: getWidth(45),
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: ColorConstant.greyD9,
                            borderRadius: BorderRadius.circular(100)),
                        child: CustomImageView(imagePath: icon)),
                  if (icon != null)
                    SizedBox(
                      width: getWidth(11),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: PMT.appStyle(
                          15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: PMT.appStyle(13,
                            fontColor: ColorConstant.textGray78),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
