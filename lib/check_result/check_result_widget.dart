import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'check_result_model.dart';
export 'check_result_model.dart';

class CheckResultWidget extends StatefulWidget {
  const CheckResultWidget({super.key});

  @override
  _CheckResultWidgetState createState() => _CheckResultWidgetState();
}

class _CheckResultWidgetState extends State<CheckResultWidget> {
  late CheckResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckResultModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.score, 0) >= 150) {
        await Future.delayed(const Duration(milliseconds: 6000));

        context.pushNamed(
          'Passed',
          queryParameters: {
            'score': serializeParam(
              valueOrDefault(currentUserDocument?.score, 0),
              ParamType.int,
            ),
          }.withoutNulls,
        );
      } else {
        await Future.delayed(const Duration(milliseconds: 6000));

        context.pushNamed(
          'Failed',
          queryParameters: {
            'score': serializeParam(
              valueOrDefault(currentUserDocument?.score, 0),
              ParamType.int,
            ),
          }.withoutNulls,
        );
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
        title: 'checkResult',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientText(
                        'Checking Results',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 35.0,
                              fontWeight: FontWeight.w800,
                            ),
                        colors: [
                          FlutterFlowTheme.of(context).customColor1,
                          const Color(0xFF1ED760)
                        ],
                        gradientDirection: GradientDirection.ltr,
                        gradientType: GradientType.linear,
                      ),
                    ],
                  ),
                  Lottie.asset(
                    'assets/lottie_animations/animation_lnt47frm.json',
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
