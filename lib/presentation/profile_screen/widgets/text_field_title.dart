import 'package:schoolxon/core/app_export.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final bool? readOnly;
  final String? hintText;
  const TextFieldWidget(
      {super.key, this.controller, this.title, this.hintText, this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: PMT.style(16),
              ),
              SizedBox(
                height: getHeight(40),
                child: TextFormField(
                  controller: controller,
                  readOnly: readOnly ?? true,
                  style: PMT.style(16,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.blackOF),
                  decoration: InputDecoration(
                    hintStyle:
                        PMT.style(16, fontColor: ColorConstant.textGray6D),
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: ColorConstant.dividerGreyE1,
        ),
        SizedBox(
          height: getHeight(15),
        ),
      ],
    );
  }
}
