// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SongStruct extends FFFirebaseStruct {
  SongStruct({
    String? songUrl,
    List<String>? guessOptions,
    int? correctOption,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _songUrl = songUrl,
        _guessOptions = guessOptions,
        _correctOption = correctOption,
        super(firestoreUtilData);

  // "song_url" field.
  String? _songUrl;
  String get songUrl => _songUrl ?? '';
  set songUrl(String? val) => _songUrl = val;
  bool hasSongUrl() => _songUrl != null;

  // "guess_options" field.
  List<String>? _guessOptions;
  List<String> get guessOptions => _guessOptions ?? const [];
  set guessOptions(List<String>? val) => _guessOptions = val;
  void updateGuessOptions(Function(List<String>) updateFn) =>
      updateFn(_guessOptions ??= []);
  bool hasGuessOptions() => _guessOptions != null;

  // "correct_option" field.
  int? _correctOption;
  int get correctOption => _correctOption ?? 0;
  set correctOption(int? val) => _correctOption = val;
  void incrementCorrectOption(int amount) =>
      _correctOption = correctOption + amount;
  bool hasCorrectOption() => _correctOption != null;

  static SongStruct fromMap(Map<String, dynamic> data) => SongStruct(
        songUrl: data['song_url'] as String?,
        guessOptions: getDataList(data['guess_options']),
        correctOption: castToType<int>(data['correct_option']),
      );

  static SongStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SongStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'song_url': _songUrl,
        'guess_options': _guessOptions,
        'correct_option': _correctOption,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'song_url': serializeParam(
          _songUrl,
          ParamType.String,
        ),
        'guess_options': serializeParam(
          _guessOptions,
          ParamType.String,
          true,
        ),
        'correct_option': serializeParam(
          _correctOption,
          ParamType.int,
        ),
      }.withoutNulls;

  static SongStruct fromSerializableMap(Map<String, dynamic> data) =>
      SongStruct(
        songUrl: deserializeParam(
          data['song_url'],
          ParamType.String,
          false,
        ),
        guessOptions: deserializeParam<String>(
          data['guess_options'],
          ParamType.String,
          true,
        ),
        correctOption: deserializeParam(
          data['correct_option'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SongStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SongStruct &&
        songUrl == other.songUrl &&
        listEquality.equals(guessOptions, other.guessOptions) &&
        correctOption == other.correctOption;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([songUrl, guessOptions, correctOption]);
}

SongStruct createSongStruct({
  String? songUrl,
  int? correctOption,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SongStruct(
      songUrl: songUrl,
      correctOption: correctOption,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SongStruct? updateSongStruct(
  SongStruct? song, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    song
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSongStructData(
  Map<String, dynamic> firestoreData,
  SongStruct? song,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (song == null) {
    return;
  }
  if (song.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && song.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final songData = getSongFirestoreData(song, forFieldValue);
  final nestedData = songData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = song.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSongFirestoreData(
  SongStruct? song, [
  bool forFieldValue = false,
]) {
  if (song == null) {
    return {};
  }
  final firestoreData = mapToFirestore(song.toMap());

  // Add any Firestore field values
  song.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSongListFirestoreData(
  List<SongStruct>? songs,
) =>
    songs?.map((e) => getSongFirestoreData(e, true)).toList() ?? [];
