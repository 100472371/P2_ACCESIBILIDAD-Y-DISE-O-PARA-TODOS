import '/flutter_flow/flutter_flow_util.dart';
import 'sing_up_page_widget.dart' show SingUpPageWidget;
import 'package:flutter/material.dart';

class SingUpPageModel extends FlutterFlowModel<SingUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for email-content widget.
  FocusNode? emailContentFocusNode;
  TextEditingController? emailContentTextController;
  String? Function(BuildContext, String?)? emailContentTextControllerValidator;
  // State field(s) for password-content widget.
  FocusNode? passwordContentFocusNode;
  TextEditingController? passwordContentTextController;
  late bool passwordContentVisibility;
  String? Function(BuildContext, String?)?
      passwordContentTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordContentVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailContentFocusNode?.dispose();
    emailContentTextController?.dispose();

    passwordContentFocusNode?.dispose();
    passwordContentTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
