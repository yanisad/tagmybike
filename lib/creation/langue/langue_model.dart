import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LangueModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for fr widget.
  bool? frValue;
  // State field(s) for en widget.
  bool? enValue;
  // State field(s) for du widget.
  bool? duValue;
  // State field(s) for ge widget.
  bool? geValue;
  // State field(s) for sw widget.
  bool? swValue;
  // State field(s) for da widget.
  bool? daValue;
  // State field(s) for spanish widget.
  bool? spanishValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
