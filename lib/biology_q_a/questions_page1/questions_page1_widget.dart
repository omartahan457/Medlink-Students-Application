import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'questions_page1_model.dart';
export 'questions_page1_model.dart';

class QuestionsPage1Widget extends StatefulWidget {
  const QuestionsPage1Widget({super.key});

  @override
  _QuestionsPage1WidgetState createState() => _QuestionsPage1WidgetState();
}

class _QuestionsPage1WidgetState extends State<QuestionsPage1Widget> {
  late QuestionsPage1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionsPage1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.randomNumber = await actions.genRandominteger();
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

    return StreamBuilder<List<MedicalYears1Record>>(
      stream: queryMedicalYears1Record(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFFF6F6F6),
            body: Center(
              child: SizedBox(
                width: 75.0,
                height: 75.0,
                child: SpinKitPumpingHeart(
                  color: FlutterFlowTheme.of(context).customColor1,
                  size: 75.0,
                ),
              ),
            ),
          );
        }
        List<MedicalYears1Record> questionsPage1MedicalYears1RecordList =
            snapshot.data!;
        return Title(
            title: 'QuestionsPage1',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: const Color(0xFFF6F6F6),
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 100.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Question: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF0D5799),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault(
                                          currentUserDocument?.index, 0)
                                      .toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF0D5799),
                                    fontSize: 20.0,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Score: ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFF0D5799),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault(
                                              currentUserDocument?.score, 0)
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: const Color(0xFF0D5799),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 0.0),
                            child: Text(
                              questionsPage1MedicalYears1RecordList[
                                      _model.randomNumber!]
                                  .question,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 96.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            color: Color(0xC52188EA),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (questionsPage1MedicalYears1RecordList
                                            .first.wrong2 ==
                                        questionsPage1MedicalYears1RecordList
                                            .first.answer) {
                                      context.pushNamed(
                                        'CorrectQuestion',
                                        queryParameters: {
                                          'question': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .question,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            valueOrDefault(
                                                currentUserDocument?.index, 0),
                                            ParamType.int,
                                          ),
                                          'answer': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .answer,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      await actions.indexIncrease(
                                        currentUserUid,
                                        'MedlinkStudentsDB',
                                      );
                                    } else {
                                      context.pushNamed(
                                        'WrongQuestion',
                                        queryParameters: {
                                          'question': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .question,
                                            ParamType.String,
                                          ),
                                          'answer': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .answer,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            valueOrDefault(
                                                currentUserDocument?.index, 0),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );

                                      await actions.indexIncrease(
                                        currentUserUid,
                                        'MedlinkStudentsDB',
                                      );
                                    }
                                  },
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              questionsPage1MedicalYears1RecordList[
                                                      _model.randomNumber!]
                                                  .wrong2,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (questionsPage1MedicalYears1RecordList
                                            .first.wrong1 ==
                                        questionsPage1MedicalYears1RecordList
                                            .first.answer) {
                                      context.pushNamed(
                                        'CorrectQuestion',
                                        queryParameters: {
                                          'question': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .question,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            valueOrDefault(
                                                currentUserDocument?.index, 0),
                                            ParamType.int,
                                          ),
                                          'answer': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .answer,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      await actions.indexIncrease(
                                        currentUserUid,
                                        'MedlinkStudentsDB',
                                      );
                                    } else {
                                      context.pushNamed(
                                        'WrongQuestion',
                                        queryParameters: {
                                          'question': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .question,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            valueOrDefault(
                                                currentUserDocument?.index, 0),
                                            ParamType.int,
                                          ),
                                          'answer': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .answer,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      await actions.indexIncrease(
                                        currentUserUid,
                                        'MedlinkStudentsDB',
                                      );
                                    }
                                  },
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              questionsPage1MedicalYears1RecordList[
                                                      _model.randomNumber!]
                                                  .wrong1,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (questionsPage1MedicalYears1RecordList
                                            .first.answer ==
                                        questionsPage1MedicalYears1RecordList
                                            .first.answer) {
                                      context.pushNamed(
                                        'CorrectQuestion',
                                        queryParameters: {
                                          'question': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .question,
                                            ParamType.String,
                                          ),
                                          'answer': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .answer,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            valueOrDefault(
                                                currentUserDocument?.index, 0),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );

                                      await actions.indexIncrease(
                                        currentUserUid,
                                        'MedlinkStudentsDB',
                                      );
                                    } else {
                                      context.pushNamed(
                                        'WrongQuestion',
                                        queryParameters: {
                                          'answer': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .answer,
                                            ParamType.String,
                                          ),
                                          'question': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .question,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            valueOrDefault(
                                                currentUserDocument?.index, 0),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );

                                      await actions.indexIncrease(
                                        currentUserUid,
                                        'MedlinkStudentsDB',
                                      );
                                    }
                                  },
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              questionsPage1MedicalYears1RecordList[
                                                      _model.randomNumber!]
                                                  .answer,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (questionsPage1MedicalYears1RecordList
                                            .first.wrong3 ==
                                        questionsPage1MedicalYears1RecordList
                                            .first.answer) {
                                      context.pushNamed(
                                        'CorrectQuestion',
                                        queryParameters: {
                                          'question': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .question,
                                            ParamType.String,
                                          ),
                                          'answer': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .answer,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            valueOrDefault(
                                                currentUserDocument?.index, 0),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );

                                      await actions.indexIncrease(
                                        currentUserUid,
                                        'MedlinkStudentsDB',
                                      );
                                    } else {
                                      context.pushNamed(
                                        'WrongQuestion',
                                        queryParameters: {
                                          'question': serializeParam(
                                            questionsPage1MedicalYears1RecordList[
                                                    _model.randomNumber!]
                                                .question,
                                            ParamType.String,
                                          ),
                                          'answer': serializeParam(
                                            questionsPage1MedicalYears1RecordList
                                                .first.answer,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            valueOrDefault(
                                                currentUserDocument?.index, 0),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );

                                      await actions.indexIncrease(
                                        currentUserUid,
                                        'MedlinkStudentsDB',
                                      );
                                    }
                                  },
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              questionsPage1MedicalYears1RecordList[
                                                      _model.randomNumber!]
                                                  .wrong3,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 16.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.white,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .customColor1,
                                        icon: const Icon(
                                          Icons.home_rounded,
                                          color: Color(0xFFFBFBFB),
                                          size: 35.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('HomePage');
                                        },
                                      ),
                                    ),
                                  ],
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
            ));
      },
    );
  }
}
