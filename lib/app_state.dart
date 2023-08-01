import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _taylorRef = prefs.getString('ff_taylorRef')?.ref ?? _taylorRef;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _taylorRef;
  DocumentReference? get taylorRef => _taylorRef;
  set taylorRef(DocumentReference? _value) {
    _taylorRef = _value;
    _value != null
        ? prefs.setString('ff_taylorRef', _value.path)
        : prefs.remove('ff_taylorRef');
  }

  List<SongStruct> _songList = [];
  List<SongStruct> get songList => _songList;
  set songList(List<SongStruct> _value) {
    _songList = _value;
  }

  void addToSongList(SongStruct _value) {
    _songList.add(_value);
  }

  void removeFromSongList(SongStruct _value) {
    _songList.remove(_value);
  }

  void removeAtIndexFromSongList(int _index) {
    _songList.removeAt(_index);
  }

  void updateSongListAtIndex(
    int _index,
    SongStruct Function(SongStruct) updateFn,
  ) {
    _songList[_index] = updateFn(_songList[_index]);
  }

  SongStruct _currentSong = SongStruct();
  SongStruct get currentSong => _currentSong;
  set currentSong(SongStruct _value) {
    _currentSong = _value;
  }

  void updateCurrentSongStruct(Function(SongStruct) updateFn) {
    updateFn(_currentSong);
  }

  int _finalScore = 0;
  int get finalScore => _finalScore;
  set finalScore(int _value) {
    _finalScore = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
