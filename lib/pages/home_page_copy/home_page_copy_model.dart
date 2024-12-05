import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/menu_hamburguesa_container/menu_hamburguesa_container_widget.dart';
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:flutter/material.dart';

class HomePageCopyModel extends FlutterFlowModel<HomePageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<PolideportivosRecord> simpleSearchResults = [];
  // Model for menu_hamburguesa_container component.
  late MenuHamburguesaContainerModel menuHamburguesaContainerModel;

  @override
  void initState(BuildContext context) {
    menuHamburguesaContainerModel =
        createModel(context, () => MenuHamburguesaContainerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    menuHamburguesaContainerModel.dispose();
  }
}
