import '/flutter_flow/flutter_flow_util.dart';
import '/pages/menu_hamburguesa_container/menu_hamburguesa_container_widget.dart';
import 'activities_a_l_l_widget.dart' show ActivitiesALLWidget;
import 'package:flutter/material.dart';

class ActivitiesALLModel extends FlutterFlowModel<ActivitiesALLWidget> {
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
