import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocRecord extends FirestoreRecord {
  LocRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "Longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  void _initializeFields() {
    _latitude = castToType<double>(snapshotData['Latitude']);
    _longitude = castToType<double>(snapshotData['Longitude']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('loc');

  static Stream<LocRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocRecord.fromSnapshot(s));

  static Future<LocRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocRecord.fromSnapshot(s));

  static LocRecord fromSnapshot(DocumentSnapshot snapshot) => LocRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocRecordData({
  double? latitude,
  double? longitude,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Latitude': latitude,
      'Longitude': longitude,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocRecordDocumentEquality implements Equality<LocRecord> {
  const LocRecordDocumentEquality();

  @override
  bool equals(LocRecord? e1, LocRecord? e2) {
    return e1?.latitude == e2?.latitude && e1?.longitude == e2?.longitude;
  }

  @override
  int hash(LocRecord? e) =>
      const ListEquality().hash([e?.latitude, e?.longitude]);

  @override
  bool isValidKey(Object? o) => o is LocRecord;
}
