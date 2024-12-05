import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/menu_hamburguesa_container/menu_hamburguesa_container_widget.dart';
import 'calendario_widget.dart' show CalendarioWidget;
import 'package:flutter/material.dart';

class CalendarioModel extends FlutterFlowModel<CalendarioWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for menu_hamburguesa_container component.
  late MenuHamburguesaContainerModel menuHamburguesaContainerModel;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    menuHamburguesaContainerModel =
        createModel(context, () => MenuHamburguesaContainerModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    menuHamburguesaContainerModel.dispose();
  }
}
