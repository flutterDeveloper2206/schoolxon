import 'package:flutter/cupertino.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/presentation/select_school_screen/school_model.dart';
import 'package:schoolxon/widgets/bouncing_button.dart';
import 'package:schoolxon/widgets/common_appBar.dart';
import 'package:schoolxon/widgets/custom_elavated_button.dart';
import 'controller/select_school_screen_controller.dart';

class SelectSchoolScreen extends GetWidget<SelectSchoolScreenController> {
  const SelectSchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(title: AppString.schools)),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorConstant.blueSecondary,
                  ),
                )
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getHeight(10),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getWidth(16)),
                          child: TextField(
                            controller: controller.controller,
                            onChanged: (value) => controller.filterItems(value),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: Bounce(
                                  onTap: () {
                                    controller.controller.clear();
                                    controller.filterItems('');
                                  },
                                  child: Icon(Icons.close)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: AppString.searchSchool,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getHeight(20),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.filterSchool.length,
                            itemBuilder: (context, index) {
                              SchoolModel item = controller.filterSchool[index];

                              return Bounce(
                                onTap: () {
                                  controller.selectedIndex.value = 1;
                                  controller.selectItem(item);
                                },
                                child: Obx(
                                  () => Container(
                                    color:
                                        item == controller.selectedSchool.value
                                            ? ColorConstant.primaryBlue
                                                .withOpacity(0.1)
                                            : Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: getWidth(16)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: getHeight(15),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CustomImageView(
                                                    height: getHeight(65),
                                                    placeHolder: ImageConstant
                                                        .imgPlaceHolder,
                                                    width: getHeight(65),
                                                    radius:
                                                        BorderRadius.circular(
                                                            18),
                                                    url:
                                                        // '${controller.filterSchool[index].baseUrl ?? ''}uploads/school_content/admin_logo/${controller.filterSchool[index].image ?? ''}',
                                                        'https://tis.schoolxon.com/uploads/school_content/admin_logo/1710573352-207163710965f54728a00dc!LOGO.jpeg',
                                                  ),
                                                  SizedBox(
                                                    width: getWidth(20),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          controller
                                                                  .filterSchool[
                                                                      index]
                                                                  .name ??
                                                              '',
                                                          maxLines: 2,
                                                          style: PMT.appStyle(
                                                              16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: getHeight(5),
                                                        ),
                                                        Text(
                                                          controller
                                                                  .filterSchool[
                                                                      index]
                                                                  .email ??
                                                              '',
                                                          style: PMT.appStyle(
                                                              13,
                                                              fontColor:
                                                                  ColorConstant
                                                                      .greyB8),
                                                        ),
                                                        SizedBox(
                                                          height: getHeight(5),
                                                        ),
                                                        Text(
                                                          controller
                                                                  .filterSchool[
                                                                      index]
                                                                  .address ??
                                                              '',
                                                          style: PMT.appStyle(
                                                              14,
                                                              fontColor:
                                                                  ColorConstant
                                                                      .grey71),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: getHeight(20),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          color: ColorConstant.greyDD,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 20, right: getWidth(16), left: getWidth(16)),
                      child: AppElevatedButton(
                        buttonName: AppString.next,
                        onPressed: () {
                          controller.next();
                        },
                      ),
                    )
                  ],
                ),
        ));
  }
}
