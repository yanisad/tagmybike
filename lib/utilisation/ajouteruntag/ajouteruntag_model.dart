import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/aucunresultat_widget.dart';
import '/components/success_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:async';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AjouteruntagModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool clicked = false;

  bool display = false;

  int? numberclick = 0;

  LatLng? locationsaved;

  bool editbuttonstate = false;

  String textegooglemaps = '';

  List<LatLng> resultsapi = [];
  void addToResultsapi(LatLng item) => resultsapi.add(item);
  void removeFromResultsapi(LatLng item) => resultsapi.remove(item);
  void removeAtIndexFromResultsapi(int index) => resultsapi.removeAt(index);
  void updateResultsapiAtIndex(int index, Function(LatLng) updateFn) =>
      resultsapi[index] = updateFn(resultsapi[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - API (overpass)] action in itineraire widget.
  ApiCallResponse? aPIresults2;
  // Stores action output result for [Backend Call - API (overpass)] action in itineraire widget.
  ApiCallResponse? aPIresults;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
