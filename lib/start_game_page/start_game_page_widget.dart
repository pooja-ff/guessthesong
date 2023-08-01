import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/option_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'start_game_page_model.dart';
export 'start_game_page_model.dart';

class StartGamePageWidget extends StatefulWidget {
  const StartGamePageWidget({
    Key? key,
    required this.document,
  }) : super(key: key);

  final ArtistRecord? document;

  @override
  _StartGamePageWidgetState createState() => _StartGamePageWidgetState();
}

class _StartGamePageWidgetState extends State<StartGamePageWidget> {
  late StartGamePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartGamePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.songList = functions
            .getRandomQuestionList(widget.document!.taylorSongList.toList())
            .toList()
            .cast<SongStruct>();
        _model.currentSong = _model.songList[_model.quesIndex];
      });
      _model.timerController.onExecute.add(StopWatchExecute.reset);

      await actions.playCurrentSong(
        _model.currentSong!.songUrl,
      );
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
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (_model.isQuizStart) {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowTimer(
                              initialTime: _model.startTimerMilliseconds,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                milliSecond: false,
                              ),
                              timer: _model.startTimerController,
                              updateStateInterval: Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.startTimerMilliseconds = value;
                                _model.startTimerValue = displayTime;
                                if (shouldUpdate) setState(() {});
                              },
                              onEnded: () async {
                                setState(() {
                                  _model.isQuizStart = true;
                                });
                                _model.timerController.onExecute
                                    .add(StopWatchExecute.start);
                                _model.soundPlayer ??= AudioPlayer();
                                if (_model.soundPlayer!.playing) {
                                  await _model.soundPlayer!.stop();
                                }
                                _model.soundPlayer!.setVolume(1.0);
                                _model.soundPlayer!
                                    .setUrl(_model.currentSong!.song)
                                    .then((_) => _model.soundPlayer!.play());
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Current Ques: ${_model.quesIndex.toString()}',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          FlutterFlowTimer(
                            initialTime: _model.timerMilliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(
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
                              await _model.updateCurrentSong(context);
                              setState(() {});
                              _model.timerController.onExecute
                                  .add(StopWatchExecute.reset);

                              _model.timerController.onExecute
                                  .add(StopWatchExecute.start);
                              await actions.playCurrentSong(
                                _model.currentSong!.songUrl,
                              );
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 5.0,
                                ),
                              ),
                              child: Builder(
                                builder: (context) {
                                  final guessOptions = (_model
                                              .currentSong?.guessOptions
                                              ?.toList() ??
                                          [])
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
                                              _model
                                                  .currentSong?.correctOption) {
                                            setState(() {
                                              _model.score = _model.score + 10;
                                            });
                                          }
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.optionItemModels.getModel(
                                            random_data
                                                .randomInteger(0, 40)
                                                .toString(),
                                            guessOptionsIndex,
                                          ),
                                          updateCallback: () => setState(() {}),
                                          child: OptionItemWidget(
                                            key: Key(
                                              'Keyjm4_${random_data.randomInteger(0, 40).toString()}',
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
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
