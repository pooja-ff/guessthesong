import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtistRecord extends FirestoreRecord {
  ArtistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taylor_song_list" field.
  List<SongStruct>? _taylorSongList;
  List<SongStruct> get taylorSongList => _taylorSongList ?? const [];
  bool hasTaylorSongList() => _taylorSongList != null;

  // "artist_name" field.
  String? _artistName;
  String get artistName => _artistName ?? '';
  bool hasArtistName() => _artistName != null;

  void _initializeFields() {
    _taylorSongList = getStructList(
      snapshotData['taylor_song_list'],
      SongStruct.fromMap,
    );
    _artistName = snapshotData['artist_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('artist');

  static Stream<ArtistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtistRecord.fromSnapshot(s));

  static Future<ArtistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArtistRecord.fromSnapshot(s));

  static ArtistRecord fromSnapshot(DocumentSnapshot snapshot) => ArtistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtistRecordData({
  String? artistName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'artist_name': artistName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtistRecordDocumentEquality implements Equality<ArtistRecord> {
  const ArtistRecordDocumentEquality();

  @override
  bool equals(ArtistRecord? e1, ArtistRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.taylorSongList, e2?.taylorSongList) &&
        e1?.artistName == e2?.artistName;
  }

  @override
  int hash(ArtistRecord? e) =>
      const ListEquality().hash([e?.taylorSongList, e?.artistName]);

  @override
  bool isValidKey(Object? o) => o is ArtistRecord;
}
