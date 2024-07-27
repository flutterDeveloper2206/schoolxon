import 'package:schoolxon/widgets/custom_elavated_button.dart';
import '../../core/app_export.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';
import '../../widgets/common_appBar.dart';
import 'controller/write_note_screen_controller.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class WriteNoteScreen extends GetWidget<WriteNoteScreenController> {
  const WriteNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.controller1.clearFocus();
        }
      },
      child: Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0), // height of appbar
            child: CommonAppBar(
              title: 'English',
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: CustomImageView(
                      svgPath: ImageConstant.icFilterSearch,
                      color: ColorConstant.primaryWhite,
                    ))
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HtmlEditor(
                controller: controller.controller1,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'Your text here...',
                  shouldEnsureVisible: true,
                  adjustHeightForKeyboard: false,
                  //initialText: "<p>text content initial, if any</p>",
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  toolbarPosition: ToolbarPosition.belowEditor, //by default
                  toolbarType: ToolbarType.nativeGrid, //by default
                  onButtonPressed:
                      (ButtonType type, bool? status, Function? updateStatus) {
                    print(
                        "button '${describeEnum(type)}' pressed, the current selected status is $status");
                    return true;
                  },
                  onDropdownChanged: (DropdownType type, dynamic changed,
                      Function(dynamic)? updateSelectedItem) {
                    print(
                        "dropdown '${describeEnum(type)}' changed to $changed");
                    return true;
                  },
                  mediaLinkInsertInterceptor:
                      (String url, InsertFileType type) {
                    print(url);
                    return true;
                  },
                  mediaUploadInterceptor:
                      (PlatformFile file, InsertFileType type) async {
                    print(file.name); //filename
                    print(file.size); //size in bytes
                    print(file.extension); //file extension (eg jpeg or mp4)
                    return true;
                  },
                ),
                otherOptions: OtherOptions(
                  height: getHeight(600),
                ),
                callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                  print('html before change is $currentHtml');
                }, onChangeContent: (String? changed) {
                  print('content changed to $changed');
                }, onChangeCodeview: (String? changed) {
                  print('code changed to $changed');
                }, onChangeSelection: (EditorSettings settings) {
                  print('parent element is ${settings.parentElement}');
                  print('font name is ${settings.fontName}');
                }, onDialogShown: () {
                  print('dialog shown');
                }, onEnter: () {
                  print('enter/return pressed');
                }, onFocus: () {
                  print('editor focused');
                }, onBlur: () {
                  print('editor unfocused');
                }, onBlurCodeview: () {
                  print('codeview either focused or unfocused');
                }, onInit: () {
                  print('init');
                },
                    //this is commented because it overrides the default Summernote handlers
                    /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                    onImageUploadError: (FileUpload? file, String? base64Str,
                        UploadError error) {
                  print(describeEnum(error));
                  print(base64Str ?? '');
                  if (file != null) {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                  }
                }, onKeyDown: (int? keyCode) {
                  print('$keyCode key downed');
                  print(
                      'current character count: ${controller.controller1.characterCount}');
                }, onKeyUp: (int? keyCode) {
                  print('$keyCode key released');
                }, onMouseDown: () {
                  print('mouse downed');
                }, onMouseUp: () {
                  print('mouse released');
                }, onNavigationRequestMobile: (String url) {
                  print(url);
                  return NavigationActionPolicy.ALLOW;
                }, onPaste: () {
                  print('pasted into editor');
                }, onScroll: () {
                  print('editor scrolled');
                }),
                plugins: [
                  SummernoteAtMention(
                      getSuggestionsMobile: (String value) {
                        var mentions = <String>['test1', 'test2', 'test3'];
                        return mentions
                            .where((element) => element.contains(value))
                            .toList();
                      },
                      mentionsWeb: ['test1', 'test2', 'test3'],
                      onSelect: (String value) {
                        print(value);
                      }),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(16), vertical: getHeight(5)),
                child: Row(
                  children: [
                    Expanded(
                      child: AppElevatedButton(
                        buttonName: 'Clear',
                        onPressed: () {
                          controller.controller1.clear();
                        },
                      ),
                    ),
                    SizedBox(
                      width: getWidth(15),
                    ),
                    Expanded(
                      child: AppElevatedButton(
                        buttonName: 'Submit',
                        onPressed: () async {
                          var txt = await controller.controller1.getText();
                          if (txt.contains('src=\"data:')) {
                            txt =
                                '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                          }
                          controller.result.value = txt;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
