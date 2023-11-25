import '/flutter_flow/flutter_flow_util.dart';
import 'correct_question_widget.dart' show CorrectQuestionWidget;
import 'package:flutter/material.dart';

class CorrectQuestionModel extends FlutterFlowModel<CorrectQuestionWidget> {
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
