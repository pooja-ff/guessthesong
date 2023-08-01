import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_login_page_model.dart';
export 'game_login_page_model.dart';

class GameLoginPageWidget extends StatefulWidget {
  const GameLoginPageWidget({Key? key}) : super(key: key);

  @override
  _GameLoginPageWidgetState createState() => _GameLoginPageWidgetState();
}

class _GameLoginPageWidgetState extends State<GameLoginPageWidget> {
  late GameLoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameLoginPageModel());

    _model.artistNameController ??= TextEditingController();
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var artistRecordReference = ArtistRecord.collection.doc();
                    await artistRecordReference.set(createArtistRecordData());
                    _model.artistTaylor = ArtistRecord.getDocumentFromData(
                        createArtistRecordData(), artistRecordReference);
                    setState(() {
                      FFAppState().taylorRef = _model.artistTaylor?.reference;
                    });

                    context.pushNamed('AddSongPage');

                    setState(() {});
                  },
                  text: 'Add More Songs',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).tertiary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Container(
                  width: 500.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.artistNameController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Artist Name',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.artistNameControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            _model.queryArtist = await queryArtistRecordOnce(
                              queryBuilder: (artistRecord) =>
                                  artistRecord.where('artist_name',
                                      isEqualTo:
                                          _model.artistNameController.text),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            setState(() {
                              FFAppState().taylorRef =
                                  _model.queryArtist?.reference;
                            });

                            context.pushNamed('AddSongPage');

                            setState(() {});
                          },
                          text: 'Add Songs',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.backendQuery = await queryArtistRecordOnce(
                      queryBuilder: (artistRecord) => artistRecord
                          .where('artist_name', isEqualTo: 'taylor'),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    FFAppState().taylorRef = _model.backendQuery?.reference;
                    FFAppState().songList = functions
                        .getRandomQuestionList(
                            _model.backendQuery!.taylorSongList.toList())
                        .toList()
                        .cast<SongStruct>();
                    FFAppState().update(() {
                      FFAppState().currentSong = FFAppState().songList[0];
                    });

                    context.pushNamed(
                      'StartGamePageCopy',
                      queryParameters: {
                        'document': serializeParam(
                          _model.backendQuery,
                          ParamType.Document,
                        ),
                        'currentIndex': serializeParam(
                          0,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'document': _model.backendQuery,
                      },
                    );

                    setState(() {});
                  },
                  text: 'Start Playing Taylor',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).tertiary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
