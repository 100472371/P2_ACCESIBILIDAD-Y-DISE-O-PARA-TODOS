import '/flutter_flow/flutter_flow_util.dart';
import '/pages/menu_hamburguesa_container/menu_hamburguesa_container_widget.dart';
import 'activity5_widget.dart' show Activity5Widget;
import 'package:flutter/material.dart';

class Activity5Model extends FlutterFlowModel<Activity5Widget> {
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
