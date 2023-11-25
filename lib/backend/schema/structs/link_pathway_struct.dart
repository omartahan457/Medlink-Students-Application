// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LinkPathwayStruct extends FFFirebaseStruct {
  LinkPathwayStruct({
    String? link,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _link = link,
        super(firestoreUtilData);

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  static LinkPathwayStruct fromMap(Map<String, dynamic> data) =>
      LinkPathwayStruct(
        link: data['link'] as String?,
      );

  static LinkPathwayStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? LinkPathwayStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static LinkPathwayStruct fromSerializableMap(Map<String, dynamic> data) =>
      LinkPathwayStruct(
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LinkPathwayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinkPathwayStruct && link == other.link;
  }

  @override
  int get hashCode => const ListEquality().hash([link]);
}

LinkPathwayStruct createLinkPathwayStruct({
  String? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LinkPathwayStruct(
      link: link,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LinkPathwayStruct? updateLinkPathwayStruct(
  LinkPathwayStruct? linkPathway, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    linkPathway
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLinkPathwayStructData(
  Map<String, dynamic> firestoreData,
  LinkPathwayStruct? linkPathway,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (linkPathway == null) {
    return;
  }
  if (linkPathway.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && linkPathway.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final linkPathwayData =
      getLinkPathwayFirestoreData(linkPathway, forFieldValue);
  final nestedData =
      linkPathwayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = linkPathway.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLinkPathwayFirestoreData(
  LinkPathwayStruct? linkPathway, [
  bool forFieldValue = false,
]) {
  if (linkPathway == null) {
    return {};
  }
  final firestoreData = mapToFirestore(linkPathway.toMap());

  // Add any Firestore field values
  linkPathway.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLinkPathwayListFirestoreData(
  List<LinkPathwayStruct>? linkPathways,
) =>
    linkPathways?.map((e) => getLinkPathwayFirestoreData(e, true)).toList() ??
    [];
