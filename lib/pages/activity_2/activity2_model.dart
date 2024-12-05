import '/flutter_flow/flutter_flow_util.dart';
import '/pages/menu_hamburguesa_container/menu_hamburguesa_container_widget.dart';
import 'activity2_widget.dart' show Activity2Widget;
import 'package:flutter/material.dart';

class Activity2Model extends FlutterFlowModel<Activity2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for menu_hamburguesa_container component.
  late MenuHamburguesaContainerModel menuHamburguesaContainerModel;

  @override
  void initState(BuildContext context) {
    menuHamburguesaContainerModel =
        createModel(context, () => MenuHamburguesaContainerModel());
  }

  @override
  void dispose() {
    menuHamburguesaContainerModel.dispose();
  }
}
