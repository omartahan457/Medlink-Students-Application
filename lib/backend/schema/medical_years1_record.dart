import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MedicalYears1Record extends FirestoreRecord {
  MedicalYears1Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "Question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

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
    _answer = snapshotData['Answer'] as String?;
    _question = snapshotData['Question'] as String?;
    _wrong1 = snapshotData['Wrong1'] as String?;
    _wrong2 = snapshotData['Wrong2'] as String?;
    _wrong3 = snapshotData['Wrong3'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medical_Years1');

  static Stream<MedicalYears1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicalYears1Record.fromSnapshot(s));

  static Future<MedicalYears1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicalYears1Record.fromSnapshot(s));

  static MedicalYears1Record fromSnapshot(DocumentSnapshot snapshot) =>
      MedicalYears1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicalYears1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicalYears1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicalYears1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicalYears1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicalYears1RecordData({
  String? answer,
  String? question,
  String? wrong1,
  String? wrong2,
  String? wrong3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Answer': answer,
      'Question': question,
      'Wrong1': wrong1,
      'Wrong2': wrong2,
      'Wrong3': wrong3,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicalYears1RecordDocumentEquality
    implements Equality<MedicalYears1Record> {
  const MedicalYears1RecordDocumentEquality();

  @override
  bool equals(MedicalYears1Record? e1, MedicalYears1Record? e2) {
    return e1?.answer == e2?.answer &&
        e1?.question == e2?.question &&
        e1?.wrong1 == e2?.wrong1 &&
        e1?.wrong2 == e2?.wrong2 &&
        e1?.wrong3 == e2?.wrong3;
  }

  @override
  int hash(MedicalYears1Record? e) => const ListEquality()
      .hash([e?.answer, e?.question, e?.wrong1, e?.wrong2, e?.wrong3]);

  @override
  bool isValidKey(Object? o) => o is MedicalYears1Record;
}
