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

class StartGamePageCopyModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int score = 0;

  bool isQuizStart = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  AudioPlayer? soundPlayer;
  // State field(s) for Timer widget.
  int timerMilliseconds = 11000;
  String timerValue = StopWatchTimer.getDisplayTime(
    11000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // Models for OptionItem dynamic component.
  late FlutterFlowDynamicModels<OptionItemModel> optionItemModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    optionItemModels = FlutterFlowDynamicModels(() => OptionItemModel());
  }

  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
    optionItemModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
