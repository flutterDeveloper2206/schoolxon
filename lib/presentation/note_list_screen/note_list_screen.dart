import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/image_constant.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/common_appBar.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/note_list_screen_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NoteListScreen extends GetWidget<NoteListScreenController> {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(
              title: 'English',
              actions: [
                IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.writeNoteScreenRout);
                    },
                    icon: Icon(
                      Icons.add,
                      color: ColorConstant.primaryWhite,
                    ))
              ],
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(20),
              ),
              Expanded(
                  child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 8,
                  pattern: [
                    const WovenGridTile(
                      4.5 / 8,
                      crossAxisRatio: 0.9,
                      // alignment: AlignmentDirectional.centerEnd,
                    ),
                    const WovenGridTile(0.9, crossAxisRatio: 1),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => Bounce(
                    onTap: () {
                      Get.toNamed(AppRoutes.noteShowScreenRout);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: index % 3 == 0
                                ? LinearGradient(
                                    colors: [
                                      controller.getRandomColor(),
                                      ColorConstant.primaryWhite
                                    ],
                                    stops: const [0.1, 1],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: ColorConstant.greyDD)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'review my personal improvement project,',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: PMT.appStyle(14,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: getHeight(20),
                              ),
                              Text(
                                'Lorem Ipsum is simply dummy text of theIpsum is simply dummy text of the printing...',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: PMT.appStyle(
                                  14,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '6 january',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: PMT.appStyle(14,
                                    fontColor: ColorConstant.greyDD),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
