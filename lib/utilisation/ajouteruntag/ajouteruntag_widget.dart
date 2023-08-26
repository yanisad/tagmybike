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
import 'ajouteruntag_model.dart';
export 'ajouteruntag_model.dart';

class AjouteruntagWidget extends StatefulWidget {
  const AjouteruntagWidget({Key? key}) : super(key: key);

  @override
  _AjouteruntagWidgetState createState() => _AjouteruntagWidgetState();
}

class _AjouteruntagWidgetState extends State<AjouteruntagWidget> {
  late AjouteruntagModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjouteruntagModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setAppLanguage(
          context, valueOrDefault(currentUserDocument?.language, ''));
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: SpinKitThreeBounce(
              color: FlutterFlowTheme.of(context).primary,
              size: 30.0,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 570.0,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: OverpassCall.call(
                                latitude: functions
                                    .tolatlon(currentUserLocationValue)
                                    .first,
                                longitude: functions
                                    .tolatlon(currentUserLocationValue)
                                    .last,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 30.0,
                                      ),
                                    ),
                                  );
                                }
                                final googleMapOverpassResponse =
                                    snapshot.data!;
                                return FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController,
                                  onCameraIdle: (latLng) =>
                                      _model.googleMapsCenter = latLng,
                                  initialLocation: _model.googleMapsCenter ??=
                                      currentUserLocationValue!,
                                  markers: (_model.numberclick == 0
                                          ? functions
                                              .closestPointsorder(
                                                  currentUserLocationValue!,
                                                  functions
                                                      .toLatLng(
                                                          OverpassCall.elements(
                                                        googleMapOverpassResponse
                                                            .jsonBody,
                                                      )?.toList())
                                                      .toList())
                                              .take(3)
                                              .toList()
                                          : _model.resultsapi)
                                      .map(
                                        (marker) => FlutterFlowMarker(
                                          marker.serialize(),
                                          marker,
                                        ),
                                      )
                                      .toList(),
                                  markerColor: GoogleMarkerColor.yellow,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.dark,
                                  initialZoom: 16.0,
                                  allowInteraction: false,
                                  allowZoom: true,
                                  showZoomControls: false,
                                  showLocation: true,
                                  showCompass: false,
                                  showMapToolbar: false,
                                  showTraffic: false,
                                  centerMapOnMarkerTap: true,
                                );
                              },
                            ),
                          ),
                          if ((isWeb
                                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                                  : _isKeyboardVisible) ==
                              false)
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 48.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Color(0x161A1300),
                                        borderRadius: 300.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: Colors.white,
                                        hoverColor: Color(0xB8FFFFFF),
                                        hoverIconColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        icon: Icon(
                                          FFIcons.ksearch,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.display =
                                                _model.display == false
                                                    ? true
                                                    : false;
                                          });
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Color(0x161A1300),
                                          borderRadius: 300.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor: Colors.white,
                                          hoverColor: Color(0xB8FFFFFF),
                                          hoverIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          icon: Icon(
                                            FFIcons.knavigation,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            currentUserLocationValue =
                                                await getCurrentUserLocation(
                                                    defaultLocation:
                                                        LatLng(0.0, 0.0));
                                            await _model
                                                .googleMapsController.future
                                                .then(
                                              (c) => c.animateCamera(
                                                CameraUpdate.newLatLng(
                                                    currentUserLocationValue!
                                                        .toGoogleMaps()),
                                              ),
                                            );
                                            setState(() {
                                              _model.clicked = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 48.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Color(0x161A1300),
                                      borderRadius: 300.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: Colors.white,
                                      hoverColor: Color(0xB8FFFFFF),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      icon: Icon(
                                        FFIcons.kedit,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _model.editbuttonstate =
                                              _model.editbuttonstate == false
                                                  ? true
                                                  : false;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.04),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 88.0, 0.0, 0.0),
                        child: Container(
                          width: 378.0,
                          height: 200.0,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (_model.display == true)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -0.72),
                                        child: FlutterFlowPlacePicker(
                                          iOSGoogleMapsApiKey:
                                              'AIzaSyDw3OqfZz3Z6ddm6EfedRyN8BFRlAPfTmg',
                                          androidGoogleMapsApiKey:
                                              'AIzaSyCJolGrAWRKHbHv-lsgvdUUodVcCwG8AN4',
                                          webGoogleMapsApiKey:
                                              'AIzaSyCmtXl8cVfznZHorBkC172FSzFS5BMDHgw',
                                          onSelect: (place) async {
                                            setState(() => _model
                                                .placePickerValue = place);
                                          },
                                          defaultText:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            '4eudq5r5' /* Where are you going? */,
                                          ),
                                          icon: Icon(
                                            FFIcons.ksearch,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 16.0,
                                          ),
                                          buttonOptions: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            color: Color(0xFF4C4B48),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'GelanoGrotesque',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                            elevation: 40.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 0.01,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(200.0),
                                          ),
                                        ),
                                      ),
                                    if (_model.display == true)
                                      Opacity(
                                        opacity: functions
                                                    .tolatlon(_model
                                                        .placePickerValue
                                                        .latLng)
                                                    .first >
                                                5.0
                                            ? 1.0
                                            : 0.3,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -0.18),
                                          child: Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: functions
                                                          .tolatlon(_model
                                                              .placePickerValue
                                                              .latLng)
                                                          .first <=
                                                      3.0
                                                  ? null
                                                  : () async {
                                                      var _shouldSetState =
                                                          false;
                                                      setState(() {
                                                        _model.numberclick =
                                                            _model.numberclick! +
                                                                1;
                                                      });
                                                      if (_model.numberclick ==
                                                          2) {
                                                        if (functions
                                                                .tolatlon(_model
                                                                    .placePickerValue
                                                                    .latLng)
                                                                .first ==
                                                            functions
                                                                .tolatlon(_model
                                                                    .locationsaved)
                                                                .first) {
                                                          setState(() {
                                                            _model.numberclick =
                                                                0;
                                                            _model.textegooglemaps =
                                                                'Rechercher l\'arceau le plus proche';
                                                          });
                                                          await launchMap(
                                                            location: _model
                                                                .placePickerValue
                                                                .latLng,
                                                            title: 'My Bike',
                                                          );
                                                        } else {
                                                          _model.aPIresults2 =
                                                              await OverpassCall
                                                                  .call(
                                                            latitude: functions
                                                                .tolatlon(_model
                                                                    .placePickerValue
                                                                    .latLng)
                                                                .first,
                                                            longitude: functions
                                                                .tolatlon(_model
                                                                    .placePickerValue
                                                                    .latLng)
                                                                .last,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (functions
                                                                  .toLatLng(
                                                                      OverpassCall
                                                                          .elements(
                                                                    (_model.aPIresults2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?.toList())
                                                                  .length ==
                                                              0) {
                                                            showAlignedDialog(
                                                              context: context,
                                                              isGlobal: true,
                                                              avoidOverflow:
                                                                  false,
                                                              targetAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              followerAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => FocusScope.of(
                                                                            context)
                                                                        .requestFocus(
                                                                            _model.unfocusNode),
                                                                    child:
                                                                        AucunresultatWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        700));
                                                            Navigator.pop(
                                                                context);
                                                          } else {
                                                            await _model
                                                                .googleMapsController
                                                                .future
                                                                .then(
                                                              (c) => c
                                                                  .animateCamera(
                                                                CameraUpdate.newLatLng(_model
                                                                    .placePickerValue
                                                                    .latLng
                                                                    .toGoogleMaps()),
                                                              ),
                                                            );
                                                            setState(() {
                                                              _model.locationsaved =
                                                                  _model
                                                                      .placePickerValue
                                                                      .latLng;
                                                              _model.numberclick =
                                                                  _model.numberclick! +
                                                                      -1;
                                                              _model.textegooglemaps =
                                                                  'Itinéraire vers l\'arceau';
                                                              _model.resultsapi = functions
                                                                  .closestPoint(
                                                                      _model.placePickerValue.latLng,
                                                                      functions
                                                                          .toLatLng(OverpassCall.elements(
                                                                            (_model.aPIresults2?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList())!
                                                                  .toList()
                                                                  .cast<LatLng>();
                                                            });
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      } else {
                                                        _model.aPIresults =
                                                            await OverpassCall
                                                                .call(
                                                          latitude: functions
                                                              .tolatlon(_model
                                                                  .placePickerValue
                                                                  .latLng)
                                                              .first,
                                                          longitude: functions
                                                              .tolatlon(_model
                                                                  .placePickerValue
                                                                  .latLng)
                                                              .last,
                                                        );
                                                        _shouldSetState = true;
                                                        if (functions
                                                                .toLatLng(
                                                                    OverpassCall
                                                                        .elements(
                                                                  (_model.aPIresults
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toList())
                                                                .length ==
                                                            0) {
                                                          showAlignedDialog(
                                                            context: context,
                                                            isGlobal: true,
                                                            avoidOverflow:
                                                                false,
                                                            targetAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            followerAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            builder:
                                                                (dialogContext) {
                                                              return Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode),
                                                                  child:
                                                                      AucunresultatWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      700));
                                                          Navigator.pop(
                                                              context);
                                                        } else {
                                                          setState(() {
                                                            _model.locationsaved =
                                                                _model
                                                                    .placePickerValue
                                                                    .latLng;
                                                            _model.textegooglemaps =
                                                                'Itinéraire vers l\'arceau';
                                                            _model.resultsapi = functions
                                                                .closestPoint(
                                                                    _model.placePickerValue.latLng,
                                                                    functions
                                                                        .toLatLng(OverpassCall.elements(
                                                                          (_model.aPIresults?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList())!
                                                                .toList()
                                                                .cast<LatLng>();
                                                          });
                                                          await _model
                                                              .googleMapsController
                                                              .future
                                                              .then(
                                                            (c) =>
                                                                c.animateCamera(
                                                              CameraUpdate
                                                                  .newLatLng(_model
                                                                      .resultsapi
                                                                      .first
                                                                      .toGoogleMaps()),
                                                            ),
                                                          );
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                              text: valueOrDefault<String>(
                                                functions
                                                            .tolatlon(_model
                                                                .placePickerValue
                                                                .latLng)
                                                            .first ==
                                                        functions
                                                            .tolatlon(_model
                                                                .locationsaved)
                                                            .first
                                                    ? _model.textegooglemaps
                                                    : 'Rechercher l\'arceau le plus proche',
                                                'Rechercher l\'arceau le plus proche',
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'GelanoGrotesque',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 96.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (_model.editbuttonstate == true)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: OverpassCall.call(
                          latitude: functions
                              .tolatlon(currentUserLocationValue)
                              .first,
                          longitude:
                              functions.tolatlon(currentUserLocationValue).last,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: SpinKitThreeBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            );
                          }
                          final textFieldOverpassResponse = snapshot.data!;
                          return Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'GelanoGrotesque',
                                      fontSize: 13.0,
                                      useGoogleFonts: false,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'ydo9234j' /* Add a note */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'GelanoGrotesque',
                                      fontSize: 13.0,
                                      useGoogleFonts: false,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                prefixIcon: Icon(
                                  FFIcons.kedit,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 17.0,
                                ),
                                suffixIcon: _model
                                        .textController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.textController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 16.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                              maxLines: 2,
                              minLines: 1,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          );
                        },
                      ),
                    ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          HapticFeedback.mediumImpact();
                          showAlignedDialog(
                            context: context,
                            isGlobal: true,
                            avoidOverflow: false,
                            targetAnchor: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode),
                                  child: SuccessWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));

                          await Future.delayed(
                              const Duration(milliseconds: 700));
                          Navigator.pop(context);
                          setState(() {
                            FFAppState().note = _model.textController.text;
                            FFAppState().date = getCurrentTimestamp;
                          });

                          context.pushNamed(
                            'Retrouvervelo',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'cv57l4ur' /* Create a tag here */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'GelanoGrotesque',
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.7,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(200.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
