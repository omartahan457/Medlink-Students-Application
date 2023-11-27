import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MedlinkStudentsDBRecord extends FirestoreRecord {
  MedlinkStudentsDBRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  bool hasTotal() => _total != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "matKey" field.
  int? _matKey;
  int get matKey => _matKey ?? 0;
  bool hasMatKey() => _matKey != null;

  // "userUniversity" field.
  String? _userUniversity;
  String get userUniversity => _userUniversity ?? '';
  bool hasUserUniversity() => _userUniversity != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "optionMat" field.
  int? _optionMat;
  int get optionMat => _optionMat ?? 0;
  bool hasOptionMat() => _optionMat != null;

  // "fullname" field.
  String? _fullname;
  String get fullname => _fullname ?? '';
  bool hasFullname() => _fullname != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "agreeState" field.
  int? _agreeState;
  int get agreeState => _agreeState ?? 0;
  bool hasAgreeState() => _agreeState != null;

  // "FailedTest" field.
  int? _failedTest;
  int get failedTest => _failedTest ?? 0;
  bool hasFailedTest() => _failedTest != null;

  // "PassedTest" field.
  int? _passedTest;
  int get passedTest => _passedTest ?? 0;
  bool hasPassedTest() => _passedTest != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _score = castToType<int>(snapshotData['score']);
    _total = castToType<int>(snapshotData['total']);
    _index = castToType<int>(snapshotData['index']);
    _matKey = castToType<int>(snapshotData['matKey']);
    _userUniversity = snapshotData['userUniversity'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _optionMat = castToType<int>(snapshotData['optionMat']);
    _fullname = snapshotData['fullname'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _agreeState = castToType<int>(snapshotData['agreeState']);
    _failedTest = castToType<int>(snapshotData['FailedTest']);
    _passedTest = castToType<int>(snapshotData['PassedTest']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MedlinkStudentsDB');

  static Stream<MedlinkStudentsDBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedlinkStudentsDBRecord.fromSnapshot(s));

  static Future<MedlinkStudentsDBRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MedlinkStudentsDBRecord.fromSnapshot(s));

  static MedlinkStudentsDBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedlinkStudentsDBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedlinkStudentsDBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedlinkStudentsDBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedlinkStudentsDBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedlinkStudentsDBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedlinkStudentsDBRecordData({
  String? uid,
  DateTime? createdTime,
  String? email,
  int? score,
  int? total,
  int? index,
  int? matKey,
  String? userUniversity,
  String? displayName,
  String? photoUrl,
  int? optionMat,
  String? fullname,
  String? phoneNumber,
  int? agreeState,
  int? failedTest,
  int? passedTest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'created_time': createdTime,
      'email': email,
      'score': score,
      'total': total,
      'index': index,
      'matKey': matKey,
      'userUniversity': userUniversity,
      'display_name': displayName,
      'photo_url': photoUrl,
      'optionMat': optionMat,
      'fullname': fullname,
      'phone_number': phoneNumber,
      'agreeState': agreeState,
      'FailedTest': failedTest,
      'PassedTest': passedTest,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedlinkStudentsDBRecordDocumentEquality
    implements Equality<MedlinkStudentsDBRecord> {
  const MedlinkStudentsDBRecordDocumentEquality();

  @override
  bool equals(MedlinkStudentsDBRecord? e1, MedlinkStudentsDBRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.email == e2?.email &&
        e1?.score == e2?.score &&
        e1?.total == e2?.total &&
        e1?.index == e2?.index &&
        e1?.matKey == e2?.matKey &&
        e1?.userUniversity == e2?.userUniversity &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.optionMat == e2?.optionMat &&
        e1?.fullname == e2?.fullname &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.agreeState == e2?.agreeState &&
        e1?.failedTest == e2?.failedTest &&
        e1?.passedTest == e2?.passedTest;
  }

  @override
  int hash(MedlinkStudentsDBRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdTime,
        e?.email,
        e?.score,
        e?.total,
        e?.index,
        e?.matKey,
        e?.userUniversity,
        e?.displayName,
        e?.photoUrl,
        e?.optionMat,
        e?.fullname,
        e?.phoneNumber,
        e?.agreeState,
        e?.failedTest,
        e?.passedTest
      ]);

  @override
  bool isValidKey(Object? o) => o is MedlinkStudentsDBRecord;
}
