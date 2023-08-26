import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
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
      _location =
          _latLngFromString(prefs.getString('ff_location')) ?? _location;
    });
    _safeInit(() {
      _photo = prefs.getString('ff_photo') ?? _photo;
    });
    _safeInit(() {
      _note = prefs.getString('ff_note') ?? _note;
    });
    _safeInit(() {
      _language = prefs.getString('ff_language') ?? _language;
    });
    _safeInit(() {
      _emoji = prefs.getString('ff_emoji') ?? _emoji;
    });
    _safeInit(() {
      _date = prefs.containsKey('ff_date')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_date')!)
          : _date;
    });
    _safeInit(() {
      _timestamp = prefs.containsKey('ff_timestamp')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_timestamp')!)
          : _timestamp;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _location = LatLng(48.8532607, 2.3696995);
  LatLng? get location => _location;
  set location(LatLng? _value) {
    _location = _value;
    _value != null
        ? prefs.setString('ff_location', _value.serialize())
        : prefs.remove('ff_location');
  }

  String _photo = '';
  String get photo => _photo;
  set photo(String _value) {
    _photo = _value;
    prefs.setString('ff_photo', _value);
  }

  String _note = '';
  String get note => _note;
  set note(String _value) {
    _note = _value;
    prefs.setString('ff_note', _value);
  }

  String _language = 'English';
  String get language => _language;
  set language(String _value) {
    _language = _value;
    prefs.setString('ff_language', _value);
  }

  String _emoji = '';
  String get emoji => _emoji;
  set emoji(String _value) {
    _emoji = _value;
    prefs.setString('ff_emoji', _value);
  }

  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? _value) {
    _date = _value;
    _value != null
        ? prefs.setInt('ff_date', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_date');
  }

  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? _value) {
    _timestamp = _value;
    _value != null
        ? prefs.setInt('ff_timestamp', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_timestamp');
  }

  int _count = 0;
  int get count => _count;
  set count(int _value) {
    _count = _value;
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
