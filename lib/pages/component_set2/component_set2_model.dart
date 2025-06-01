import '/components/page_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'component_set2_widget.dart' show ComponentSet2Widget;
import 'package:flutter/material.dart';

class ComponentSet2Model extends FlutterFlowModel<ComponentSet2Widget> {
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
