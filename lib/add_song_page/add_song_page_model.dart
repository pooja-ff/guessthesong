import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSongPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? currentSong = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Option1 widget.
  TextEditingController? option1Controller;
  String? Function(BuildContext, String?)? option1ControllerValidator;
  // State field(s) for Option2 widget.
  TextEditingController? option2Controller;
  String? Function(BuildContext, String?)? option2ControllerValidator;
  // State field(s) for Option3 widget.
  TextEditingController? option3Controller;
  String? Function(BuildContext, String?)? option3ControllerValidator;
  // State field(s) for Option4 widget.
  TextEditingController? option4Controller;
  String? Function(BuildContext, String?)? option4ControllerValidator;
  // State field(s) for CorrectOption widget.
  TextEditingController? correctOptionController;
  String? Function(BuildContext, String?)? correctOptionControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    option1Controller?.dispose();
    option2Controller?.dispose();
    option3Controller?.dispose();
    option4Controller?.dispose();
    correctOptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
