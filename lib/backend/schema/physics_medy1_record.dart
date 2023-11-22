import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhysicsMedy1Record extends FirestoreRecord {
  PhysicsMedy1Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "Answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "Wrong1" field.
  String? _wrong1;
  String get wrong1 => _wrong1 ?? '';
  bool hasWrong1() => _wrong1 != null;

  // "Wrong2" field.
  String? _wrong2;
  String get wrong2 => _wrong2 ?? '';
  bool hasWrong2() => _wrong2 != null;

  // "Wrong3" field.
  String? _wrong3;
  String get wrong3 => _wrong3 ?? '';
  bool hasWrong3() => _wrong3 != null;

  void _initializeFields() {
    _question = snapshotData['Question'] as String?;
    _answer = snapshotData['Answer'] as String?;
    _wrong1 = snapshotData['Wrong1'] as String?;
    _wrong2 = snapshotData['Wrong2'] as String?;
    _wrong3 = snapshotData['Wrong3'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('physics_Medy1');

  static Stream<PhysicsMedy1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhysicsMedy1Record.fromSnapshot(s));

  static Future<PhysicsMedy1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhysicsMedy1Record.fromSnapshot(s));

  static PhysicsMedy1Record fromSnapshot(DocumentSnapshot snapshot) =>
      PhysicsMedy1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhysicsMedy1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhysicsMedy1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhysicsMedy1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhysicsMedy1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhysicsMedy1RecordData({
  String? question,
  String? answer,
  String? wrong1,
  String? wrong2,
  String? wrong3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Question': question,
      'Answer': answer,
      'Wrong1': wrong1,
      'Wrong2': wrong2,
      'Wrong3': wrong3,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhysicsMedy1RecordDocumentEquality
    implements Equality<PhysicsMedy1Record> {
  const PhysicsMedy1RecordDocumentEquality();

  @override
  bool equals(PhysicsMedy1Record? e1, PhysicsMedy1Record? e2) {
    return e1?.question == e2?.question &&
        e1?.answer == e2?.answer &&
        e1?.wrong1 == e2?.wrong1 &&
        e1?.wrong2 == e2?.wrong2 &&
        e1?.wrong3 == e2?.wrong3;
  }

  @override
  int hash(PhysicsMedy1Record? e) => const ListEquality()
      .hash([e?.question, e?.answer, e?.wrong1, e?.wrong2, e?.wrong3]);

  @override
  bool isValidKey(Object? o) => o is PhysicsMedy1Record;
}
