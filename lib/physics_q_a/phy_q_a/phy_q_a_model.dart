import '/flutter_flow/flutter_flow_util.dart';
import 'phy_q_a_widget.dart' show PhyQAWidget;
import 'package:flutter/material.dart';

class PhyQAModel extends FlutterFlowModel<PhyQAWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - genRandomPhy] action in PhyQA widget.
  int? randomPhy;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
