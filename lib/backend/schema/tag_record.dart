import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagRecord extends FirestoreRecord {
  TagRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "localisation" field.
  DocumentReference? _localisation;
  DocumentReference? get localisation => _localisation;
  bool hasLocalisation() => _localisation != null;

  // "note" field.
  DocumentReference? _note;
  DocumentReference? get note => _note;
  bool hasNote() => _note != null;

  // "photo" field.
  DocumentReference? _photo;
  DocumentReference? get photo => _photo;
  bool hasPhoto() => _photo != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _localisation = snapshotData['localisation'] as DocumentReference?;
    _note = snapshotData['note'] as DocumentReference?;
    _photo = snapshotData['photo'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tag');

  static Stream<TagRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagRecord.fromSnapshot(s));

  static Future<TagRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagRecord.fromSnapshot(s));

  static TagRecord fromSnapshot(DocumentSnapshot snapshot) => TagRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagRecordData({
  DocumentReference? localisation,
  DocumentReference? note,
  DocumentReference? photo,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'localisation': localisation,
      'note': note,
      'photo': photo,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class TagRecordDocumentEquality implements Equality<TagRecord> {
  const TagRecordDocumentEquality();

  @override
  bool equals(TagRecord? e1, TagRecord? e2) {
    return e1?.localisation == e2?.localisation &&
        e1?.note == e2?.note &&
        e1?.photo == e2?.photo &&
        e1?.user == e2?.user;
  }

  @override
  int hash(TagRecord? e) =>
      const ListEquality().hash([e?.localisation, e?.note, e?.photo, e?.user]);

  @override
  bool isValidKey(Object? o) => o is TagRecord;
}
