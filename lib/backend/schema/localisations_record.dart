import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalisationsRecord extends FirestoreRecord {
  LocalisationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "geographie" field.
  LatLng? _geographie;
  LatLng? get geographie => _geographie;
  bool hasGeographie() => _geographie != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _geographie = snapshotData['geographie'] as LatLng?;
    _date = snapshotData['date'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('localisations');

  static Stream<LocalisationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocalisationsRecord.fromSnapshot(s));

  static Future<LocalisationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocalisationsRecord.fromSnapshot(s));

  static LocalisationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocalisationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocalisationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocalisationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocalisationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocalisationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocalisationsRecordData({
  LatLng? geographie,
  DateTime? date,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'geographie': geographie,
      'date': date,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocalisationsRecordDocumentEquality
    implements Equality<LocalisationsRecord> {
  const LocalisationsRecordDocumentEquality();

  @override
  bool equals(LocalisationsRecord? e1, LocalisationsRecord? e2) {
    return e1?.geographie == e2?.geographie &&
        e1?.date == e2?.date &&
        e1?.user == e2?.user;
  }

  @override
  int hash(LocalisationsRecord? e) =>
      const ListEquality().hash([e?.geographie, e?.date, e?.user]);

  @override
  bool isValidKey(Object? o) => o is LocalisationsRecord;
}
