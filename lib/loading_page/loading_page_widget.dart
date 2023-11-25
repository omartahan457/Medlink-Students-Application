import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'loading_page_model.dart';
export 'loading_page_model.dart';

class LoadingPageWidget extends StatefulWidget {
  const LoadingPageWidget({super.key});

  @override
  _LoadingPageWidgetState createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget> {
  late LoadingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3500));
      if (valueOrDefault(currentUserDocument?.matKey, 0) <= 3) {
        context.pushNamed(
          'universityMaterials',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.topToBottom,
            ),
          },
        );
      } else if (valueOrDefault(currentUserDocument?.matKey, 0) <= 5) {
        context.pushNamed('additionalNotObligatory');
      } else if (valueOrDefault(currentUserDocument?.matKey, 0) <= 8) {
        context.pushNamed('additionalNotObligatory_2');
      } else if (valueOrDefault(currentUserDocument?.matKey, 0) <= 13) {
        context.pushNamed('Bulgaria');
      } else if (valueOrDefault(currentUserDocument?.matKey, 0) <= 20) {
        context.pushNamed('coratia_ukraine');
      } else if (valueOrDefault(currentUserDocument?.matKey, 0) <= 21) {
        context.pushNamed('Serbia');
      } else if (valueOrDefault(currentUserDocument?.matKey, 0) <= 26) {
        context.pushNamed('Italy');
      } else if (valueOrDefault(currentUserDocument?.matKey, 0) <= 40) {
        context.pushNamed('SLOVAKIA');
      } else if (valueOrDefault(currentUserDocument?.matKey, 0) <= 51) {
        context.pushNamed('Poland');
      } else if (valueOrDefault(currentUserDocument?.matKey, 0) == 30) {
        context.pushNamed('HUNGARY');
      }
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Title(
        title: 'loadingPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF6F6F6),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Medlink.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 20.0),
                      child: Text(
                        'Loading',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: const Color(0xFF1E67B4),
                              fontSize: 45.0,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    Lottie.asset(
                      'assets/lottie_animations/animation_lnvvt7jn.json',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
