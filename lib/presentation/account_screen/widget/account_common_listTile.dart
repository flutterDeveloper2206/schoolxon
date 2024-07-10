import 'package:schoolxon/widgets/bouncing_button.dart';

import '../../../core/app_export.dart';

class AccountCommonListTile extends StatelessWidget {
  final String? icon;
  final String title;
  final void Function()? onTap;
  const AccountCommonListTile({super.key,  this.icon, required this.title,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap:onTap?? () {

      },
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: getHeight(14)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if(icon!=null)CustomImageView(svgPath: icon),
                if(icon!=null)SizedBox(width: getWidth(15),),
                Text(
                  title,
                  style: PMT.style(17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            CustomImageView(svgPath: ImageConstant.icRight,),

                ],
        ),
      ),
    );
  }
}
