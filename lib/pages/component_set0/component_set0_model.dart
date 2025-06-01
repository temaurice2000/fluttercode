import '/components/comp1_widget.dart';
import '/components/page_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'component_set0_widget.dart' show ComponentSet0Widget;
import 'package:flutter/material.dart';

class ComponentSet0Model extends FlutterFlowModel<ComponentSet0Widget> {
  ///  Local state fields for this page.

  int adults = 1;

  int children = 1;

  String selected = 'oneway';

  ///  State fields for stateful widgets in this page.

  // Model for beds.
  late Comp1Model bedsModel;
  // Model for dinner.
  late Comp1Model dinnerModel;
  // Model for HotTub.
  late Comp1Model hotTubModel;
  // Model for AC.
  late Comp1Model acModel;
  // Model for pageList component.
  late PageListModel pageListModel;

  @override
  void initState(BuildContext context) {
    bedsModel = createModel(context, () => Comp1Model());
    dinnerModel = createModel(context, () => Comp1Model());
    hotTubModel = createModel(context, () => Comp1Model());
    acModel = createModel(context, () => Comp1Model());
    pageListModel = createModel(context, () => PageListModel());
  }

  @override
  void dispose() {
    bedsModel.dispose();
    dinnerModel.dispose();
    hotTubModel.dispose();
    acModel.dispose();
    pageListModel.dispose();
  }
}
