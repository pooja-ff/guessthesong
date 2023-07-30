import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GameLoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ArtistRecord? artistTaylor;
  // State field(s) for artistName widget.
  TextEditingController? artistNameController;
  String? Function(BuildContext, String?)? artistNameControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ArtistRecord? queryArtist;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ArtistRecord? backendQuery;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    artistNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
