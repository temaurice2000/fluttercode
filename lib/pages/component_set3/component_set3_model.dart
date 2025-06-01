import '/components/page_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'component_set3_widget.dart' show ComponentSet3Widget;
import 'package:flutter/material.dart';

class ComponentSet3Model extends FlutterFlowModel<ComponentSet3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for pageList component.
  late PageListModel pageListModel;

  @override
  void initState(BuildContext context) {
    pageListModel = createModel(context, () => PageListModel());
  }

  @override
  void dispose() {
    pageListModel.dispose();
  }
}
