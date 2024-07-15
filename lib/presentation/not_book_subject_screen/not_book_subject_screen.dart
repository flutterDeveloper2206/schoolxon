import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/image_constant.dart';
import 'package:schoolxon/core/utils/size_utils.dart';
import 'package:schoolxon/presentation/not_book_subject_screen/widgets/subject_card_widget.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/common_appBar.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/not_book_subject_screen_controller.dart';

class NoteBookSubjectScreen extends GetWidget<NoteBookSubjectScreenController> {
  const NoteBookSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(title: AppString.noteBook)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(20),
              ),
              Text(
                AppString.selectYourSubject,
                style: PMT.appStyle(16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 12 / 4.5,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: controller.subjects.length,
                  itemBuilder: (context, index) {
                    return Bounce(
                      onTap: () {
                        Get.toNamed(AppRoutes.noteListScreenRout);
                      },
                      child: SubjectCard(
                        name: controller.subjects[index]['name'],
                        color: controller.subjects[index]['color'],
                        initial: controller.subjects[index]['initial'],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
