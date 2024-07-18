import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/core/utils/image_constant.dart';
import 'package:schoolxon/routes/app_routes.dart';
import 'package:schoolxon/widgets/custom_elavated_button.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/note_show_screen_controller.dart';

class NoteShowScreen extends StatefulWidget {
  const NoteShowScreen({super.key});

  @override
  State<NoteShowScreen> createState() => _NoteShowScreenState();
}

class _NoteShowScreenState extends State<NoteShowScreen> {
  RxString searchWord = ''.obs;
  int count = 0;
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return Scaffold(
        backgroundColor: ColorConstant.yellowFA,
        appBar: AppBar(
          backgroundColor: ColorConstant.yellowFA, // Background color
          leading: InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onTap: () {},
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
          centerTitle: isSearch == false ? true : false,
          actions: isSearch == false
              ? [
                  IconButton(
                      onPressed: () {
                        isSearch = true;
                        setState(() {});
                      },
                      icon: CustomImageView(
                        svgPath: ImageConstant.icFilterSearch,
                      ))
                ]
              : null,
          title: isSearch == false
              ? Text(
                  'English',
                  style: PMT.appStyle(18, fontWeight: FontWeight.w600),
                )
              : Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          searchWord.value = value;
                          count = countOccurrences(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged',
                              searchWord.value);

                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',

                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConstant.primaryBlack),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConstant.primaryBlack),
                          ),
                          // border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          isSearch = false;
                          setState(() {});
                        },
                        icon: Icon(Icons.close, color: Colors.black)),
                  ],
                ),
        ),
        bottomNavigationBar: isSearch == false
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(16), vertical: getHeight(10)),
                child: AppElevatedButton(
                  buttonName: AppString.edit,
                  onPressed: () {
                    Get.toNamed(AppRoutes.writeNoteScreenRout);
                  },
                ),
              )
            : Container(
                color: ColorConstant.primaryWhite,
                height: getHeight(50),
                child: Center(
                  child: Text(
                    '${count} ${AppString.wordsFound}',
                    style: PMT.appStyle(14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(30),
              ),
              SizedBox(
                width: getWidth(300),
                child: Text(
                  'review my personal improvement project',
                  style: PMT.appStyle(20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Container(
                height: 2,
                color: ColorConstant.primaryBlack.withOpacity(0.22),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              RichText(
                text: buildHighlightedText(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged',
                    searchWord.value),
              ),
            ],
          ),
        ));
  }

  int countOccurrences(String text, String searchWord) {
    if (searchWord.isEmpty) {
      return 0;
    }
    int count = 0;
    int start = 0;
    int index;
    while ((index =
            text.toLowerCase().indexOf(searchWord.toLowerCase(), start)) !=
        -1) {
      count++;
      start = index + searchWord.length;
    }
    return count;
  }

  TextSpan buildHighlightedText(String text, String searchWord) {
    if (searchWord.isEmpty) {
      count = 0;
      return TextSpan(text: text, style: PMT.appStyle(15));
    }

    List<TextSpan> spans = [];
    int start = 0;
    int index;

    while ((index =
            text.toLowerCase().indexOf(searchWord.toLowerCase(), start)) !=
        -1) {
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index)));
      }
      count++;
      print('asdfsdf ${count}');
      setState(() {});
      spans.add(TextSpan(
        text: text.substring(index, index + searchWord.length),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          backgroundColor:
              ColorConstant.primaryBlue, // Highlight background color
        ),
      ));
      start = index + searchWord.length;
    }

    if (start < text.length) {
      count = 0;

      spans.add(TextSpan(text: text.substring(start)));
    }

    return TextSpan(children: spans, style: PMT.appStyle(15));
  }
}
