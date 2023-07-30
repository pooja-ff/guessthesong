import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SongRecord extends FirestoreRecord {
  SongRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "song_url" field.
  String? _songUrl;
  String get songUrl => _songUrl ?? '';
  bool hasSongUrl() => _songUrl != null;

  // "guess_options" field.
  List<String>? _guessOptions;
  List<String> get guessOptions => _guessOptions ?? const [];
  bool hasGuessOptions() => _guessOptions != null;

  // "correct_option" field.
  int? _correctOption;
  int get correctOption => _correctOption ?? 0;
  bool hasCorrectOption() => _correctOption != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _songUrl = snapshotData['song_url'] as String?;
    _guessOptions = getDataList(snapshotData['guess_options']);
    _correctOption = castToType<int>(snapshotData['correct_option']);
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('song');

  static Stream<SongRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SongRecord.fromSnapshot(s));

  static Future<SongRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SongRecord.fromSnapshot(s));

  static SongRecord fromSnapshot(DocumentSnapshot snapshot) => SongRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SongRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SongRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SongRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SongRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSongRecordData({
  String? songUrl,
  int? correctOption,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'song_url': songUrl,
      'correct_option': correctOption,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class SongRecordDocumentEquality implements Equality<SongRecord> {
  const SongRecordDocumentEquality();

  @override
  bool equals(SongRecord? e1, SongRecord? e2) {
    const listEquality = ListEquality();
    return e1?.songUrl == e2?.songUrl &&
        listEquality.equals(e1?.guessOptions, e2?.guessOptions) &&
        e1?.correctOption == e2?.correctOption &&
        e1?.image == e2?.image;
  }

  @override
  int hash(SongRecord? e) => const ListEquality()
      .hash([e?.songUrl, e?.guessOptions, e?.correctOption, e?.image]);

  @override
  bool isValidKey(Object? o) => o is SongRecord;
}
