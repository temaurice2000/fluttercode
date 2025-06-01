import '/components/page_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'component_set1_widget.dart' show ComponentSet1Widget;
import 'package:flutter/material.dart';

class ComponentSet1Model extends FlutterFlowModel<ComponentSet1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for pageList component.
  late PageListModel pageListModel;
  // State field(s) for TextField widget.
  final textFieldKey1 = GlobalKey();
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? textFieldSelectedOption1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  final textFieldKey2 = GlobalKey();
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? textFieldSelectedOption2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    pageListModel = createModel(context, () => PageListModel());
  }

  @override
  void dispose() {
    pageListModel.dispose();
    textFieldFocusNode1?.dispose();

    textFieldFocusNode2?.dispose();
  }
}
