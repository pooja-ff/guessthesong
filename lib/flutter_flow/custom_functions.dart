import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<SongStruct> getRandomQuestionList(List<SongStruct> list) {
  // Create a random list of 10 integers from the given list length
  List<SongStruct> randomList = [];
  final random = math.Random();
  for (int i = 0; i < list.length; i++) {
    randomList.add(list[random.nextInt(list.length)]);
  }
  return randomList;
}

List<String> getCurrentQuesOptions(SongStruct currentSong) {
  // get the guess_options list from thr given SongStruct?
  return currentSong.guessOptions;
}
