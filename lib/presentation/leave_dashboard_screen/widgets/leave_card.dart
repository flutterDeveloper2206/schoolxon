import 'package:schoolxon/core/utils/size_utils.dart';

import '../../../core/app_export.dart';
import '../controller/leave_dashboard_screen_controller.dart';

class LeaveCard extends StatelessWidget {
  final Leave leave;

  LeaveCard({required this.leave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstant.cardColor,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getHeight(14), horizontal: getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    leave.type,
                    style: PMT.appStyle(14,
                        fontColor: ColorConstant.grey81,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: leave.status == 'Approved'
                          ? ColorConstant.green19.withOpacity(0.2)
                          : ColorConstant.redFB.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(leave.status,
                        style: PMT.appStyle(12,
                            fontColor: leave.status == 'Approved'
                                ? ColorConstant.green19
                                : ColorConstant.redFB,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                leave.date,
                style: PMT.appStyle(16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Text(
                AppString.viewDetails,
                style: PMT.appStyle(14, fontColor: ColorConstant.primaryBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
