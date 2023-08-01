import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/option_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'start_game_page_copy_model.dart';
export 'start_game_page_copy_model.dart';

class StartGamePageCopyWidget extends StatefulWidget {
  const StartGamePageCopyWidget({
    Key? key,
    required this.document,
    int? currentIndex,
  })  : this.currentIndex = currentIndex ?? 0,
        super(key: key);

  final ArtistRecord? document;
  final int currentIndex;

  @override
  _StartGamePageCopyWidgetState createState() =>
      _StartGamePageCopyWidgetState();
}

class _StartGamePageCopyWidgetState extends State<StartGamePageCopyWidget> {
  late StartGamePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartGamePageCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(1.0);
      _model.soundPlayer!
          .setUrl(FFAppState().currentSong.song)
          .then((_) => _model.soundPlayer!.play());

      _model.timerController.onExecute.add(StopWatchExecute.start);
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Current Ques: ${widget.currentIndex.toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  FlutterFlowTimer(
                    initialTime: _model.timerMilliseconds,
                    getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                      value,
                      hours: false,
                      milliSecond: false,
                    ),
                    timer: _model.timerController,
                    updateStateInterval: Duration(milliseconds: 1000),
                    onChanged: (value, displayTime, shouldUpdate) {
                      _model.timerMilliseconds = value;
                      _model.timerValue = displayTime;
                      if (shouldUpdate) setState(() {});
                    },
                    onEnded: () async {
                      setState(() {
                        FFAppState().currentSong =
                            FFAppState().songList[valueOrDefault<int>(
                          widget.currentIndex + 1,
                          0,
                        )];
                      });
                      if (FFAppState().songList.length !=
                          (widget.currentIndex + 1)) {
                        context.pushNamed(
                          'StartGamePageCopy',
                          queryParameters: {
                            'document': serializeParam(
                              widget.document,
                              ParamType.Document,
                            ),
                            'currentIndex': serializeParam(
                              widget.currentIndex + 1,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'document': widget.document,
                          },
                        );
                      }
                    },
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 500.0,
                      height: 500.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 5.0,
                        ),
                      ),
                      child: Builder(
                        builder: (context) {
                          final guessOptions = FFAppState()
                              .currentSong
                              .guessOptions
                              .toList()
                              .take(4)
                              .toList();
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0.0,
                              mainAxisSpacing: 0.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: guessOptions.length,
                            itemBuilder: (context, guessOptionsIndex) {
                              final guessOptionsItem =
                                  guessOptions[guessOptionsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (guessOptionsIndex ==
                                      FFAppState().currentSong.correctOption) {
                                    setState(() {
                                      _model.score = _model.score + 10;
                                    });
                                  }
                                },
                                child: wrapWithModel(
                                  model: _model.optionItemModels.getModel(
                                    random_data.randomInteger(0, 40).toString(),
                                    guessOptionsIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: OptionItemWidget(
                                    key: Key(
                                      'Keymoe_${random_data.randomInteger(0, 40).toString()}',
                                    ),
                                    optionTitle: guessOptionsItem,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    'Current Score: ${_model.score.toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
