import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/string_constant.dart';
import '../../widgets/common_appBar.dart';
import 'controller/pdf_screen_controller.dart';

class PDFScreen extends GetWidget<PDFScreenController> {
  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0), // height of appbar
          child: CommonAppBar(
            title: AppString.marksSheet,
            elevation: 0,
          )),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SfPdfViewer.network(
              'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
            ),
          ],
        ),
      ),
    );
  }

}