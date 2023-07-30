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
import 'package:provider/provider.dart';

class StartGamePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int quesIndex = 0;

  List<SongStruct> songList = [];
  void addToSongList(SongStruct item) => songList.add(item);
  void removeFromSongList(SongStruct item) => songList.remove(item);
  void removeAtIndexFromSongList(int index) => songList.removeAt(index);
  void updateSongListAtIndex(int index, Function(SongStruct) updateFn) =>
      songList[index] = updateFn(songList[index]);

  SongStruct? currentSong;
  void updateCurrentSongStruct(Function(SongStruct) updateFn) =>
      updateFn(currentSong ??= SongStruct());

  int score = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Timer widget.
  int timerMilliseconds = 10000;
  String timerValue = StopWatchTimer.getDisplayTime(
    10000,
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

  Future updateCurrentSong(BuildContext context) async {
    quesIndex = quesIndex + 1;
    currentSong = songList[quesIndex];
  }

  /// Additional helper methods are added here.
}
