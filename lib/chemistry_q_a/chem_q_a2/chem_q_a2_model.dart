import '/flutter_flow/flutter_flow_util.dart';
import 'chem_q_a2_widget.dart' show ChemQA2Widget;
import 'package:flutter/material.dart';

class ChemQA2Model extends FlutterFlowModel<ChemQA2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - genRandomChem] action in ChemQA2 widget.
  int? randomChem;

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
