import '/flutter_flow/flutter_flow_util.dart';
import 'correct_chem_widget.dart' show CorrectChemWidget;
import 'package:flutter/material.dart';

class CorrectChemModel extends FlutterFlowModel<CorrectChemWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - genRandomPage] action in Button widget.
  int? randomPage;

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
