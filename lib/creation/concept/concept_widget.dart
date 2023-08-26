import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'concept_model.dart';
export 'concept_model.dart';

class ConceptWidget extends StatefulWidget {
  const ConceptWidget({Key? key}) : super(key: key);

  @override
  _ConceptWidgetState createState() => _ConceptWidgetState();
}

class _ConceptWidgetState extends State<ConceptWidget> {
  late ConceptModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConceptModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setAppLanguage(context, FFAppState().language);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              FFIcons.kchevronLeft,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  _model.pageViewCurrentIndex == 0
                                      ? () {
                                          if (FFAppState().language == 'fr') {
                                            return 'Localise les arceaux à proximité.';
                                          } else if (FFAppState().language ==
                                              'nl') {
                                            return 'Zoek parkeerrekken in de buurt.';
                                          } else if (FFAppState().language ==
                                              'de') {
                                            return 'Finden Sie nahegelegene Parkhäuser.';
                                          } else if (FFAppState().language ==
                                              'da') {
                                            return 'Find parkeringsstativer i nærheden.';
                                          } else if (FFAppState().language ==
                                              'es') {
                                            return 'Localizar aparcamientos cercanos.';
                                          } else if (FFAppState().language ==
                                              'sv') {
                                            return 'Lokalisera närliggande parkeringsställen.';
                                          } else {
                                            return 'Locate nearby parking racks.';
                                          }
                                        }()
                                      : () {
                                          if (FFAppState().language == 'fr') {
                                            return 'Un tag.';
                                          } else if (FFAppState().language ==
                                              'nl') {
                                            return 'Een tag.';
                                          } else if (FFAppState().language ==
                                              'de') {
                                            return 'Ein Tag.';
                                          } else if (FFAppState().language ==
                                              'da') {
                                            return 'En tag.';
                                          } else if (FFAppState().language ==
                                              'sv') {
                                            return 'En tagg.';
                                          } else if (FFAppState().language ==
                                              'es') {
                                            return 'Una etiqueta.';
                                          } else {
                                            return 'A tag.';
                                          }
                                        }(),
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        fontFamily: 'GelanoGrotesque',
                                        fontSize: 27.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    _model.pageViewCurrentIndex == 0
                                        ? () {
                                            if (FFAppState().language == 'fr') {
                                              return 'Pour garer ton vélo en sécurité.';
                                            } else if (FFAppState().language ==
                                                'nl') {
                                              return 'Je fiets veilig stallen.';
                                            } else if (FFAppState().language ==
                                                'de') {
                                              return 'Um dein Fahrrad sicher abzustellen.';
                                            } else if (FFAppState().language ==
                                                'da') {
                                              return 'Sådan parkerer du din cykel sikkert.';
                                            } else if (FFAppState().language ==
                                                'es') {
                                              return 'Para aparcar la bici con seguridad.';
                                            } else if (FFAppState().language ==
                                                'sv') {
                                              return 'För att parkera din cykel på ett säkert sätt.';
                                            } else {
                                              return 'To park your bike safely.';
                                            }
                                          }()
                                        : () {
                                            if (FFAppState().language == 'fr') {
                                              return 'Tu sais précisément où tu as déposé ton vélo.';
                                            } else if (FFAppState().language ==
                                                'nl') {
                                              return 'Je weet precies waar je je fiets hebt gelaten.';
                                            } else if (FFAppState().language ==
                                                'de') {
                                              return 'Du weißt genau, wo du dein Fahrrad abgestellt hast.';
                                            } else if (FFAppState().language ==
                                                'da') {
                                              return 'Du ved præcis, hvor du har efterladt din cykel.';
                                            } else if (FFAppState().language ==
                                                'es') {
                                              return 'Sabes exactamente dónde has dejado la moto.';
                                            } else if (FFAppState().language ==
                                                'sv') {
                                              return 'Du vet exakt var du lämnade din cykel.';
                                            } else {
                                              return 'You know exactly where you left your bike.';
                                            }
                                          }(),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 200.0,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        height: 430.0,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 40.0),
                                              child: PageView(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: 0),
                                                onPageChanged: (_) =>
                                                    setState(() {}),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(32.0, 0.0,
                                                                32.0, 64.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Image.asset(
                                                        'assets/images/pic1.png',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(32.0, 0.0,
                                                                32.0, 64.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Image.asset(
                                                        'assets/images/pic2.png',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 64.0),
                                                child: smooth_page_indicator
                                                    .SmoothPageIndicator(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: 0),
                                                  count: 2,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  onDotClicked: (i) async {
                                                    await _model
                                                        .pageViewController!
                                                        .animateToPage(
                                                      i,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  effect: smooth_page_indicator
                                                      .SlideEffect(
                                                    spacing: 8.0,
                                                    radius: 16.0,
                                                    dotWidth: 10.0,
                                                    dotHeight: 10.0,
                                                    dotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                    activeDotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    paintStyle:
                                                        PaintingStyle.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 96.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.pageViewCurrentIndex == 1) {
                                  context.pushNamed(
                                    'Bitmoji',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                } else {
                                  await _model.pageViewController?.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  setState(() {
                                    FFAppState().count = FFAppState().count + 1;
                                  });
                                }
                              },
                              text: _model.pageViewCurrentIndex == 0
                                  ? () {
                                      if (FFAppState().language == 'fr') {
                                        return 'Suivant';
                                      } else if (FFAppState().language ==
                                          'nl') {
                                        return 'Volgende';
                                      } else if (FFAppState().language ==
                                          'de') {
                                        return 'Weiter zu';
                                      } else if (FFAppState().language ==
                                          'da') {
                                        return 'Næste';
                                      } else if (FFAppState().language ==
                                          'es') {
                                        return 'Siguiente';
                                      } else if (FFAppState().language ==
                                          'sv') {
                                        return 'Nästa';
                                      } else {
                                        return 'Next';
                                      }
                                    }()
                                  : () {
                                      if (FFAppState().language == 'fr') {
                                        return 'J\'ai compris !';
                                      } else if (FFAppState().language ==
                                          'nl') {
                                        return 'Ik heb het!';
                                      } else if (FFAppState().language ==
                                          'de') {
                                        return 'Ich habe verstanden!';
                                      } else if (FFAppState().language ==
                                          'da') {
                                        return 'Jeg har den!';
                                      } else if (FFAppState().language ==
                                          'sv') {
                                        return 'Jag har den!';
                                      } else if (FFAppState().language ==
                                          'es') {
                                        return '¡Ya lo tengo!';
                                      } else {
                                        return 'Got it!';
                                      }
                                    }(),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle:
                                    FlutterFlowTheme.of(context).titleSmall,
                                elevation: 0.7,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(200.0),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
