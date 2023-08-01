// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';

final player = AudioPlayer(); // Create a player
// Stop and free resources

Future playCurrentSong(String songUrl) async {
  // Add your function code here!
  final duration = await player.setUrl(songUrl);
  await player.play(); // Play while waiting for completion
}
