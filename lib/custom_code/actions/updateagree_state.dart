// Automatic FlutterFlow imports
import 'package:flutter/material.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future updateagreeState(String userData, String userCollectionData) async {
  final studentRef =
      FirebaseFirestore.instance.collection('MedlinkStudentsDB').doc(userData);

  // Get the current agreeState
  final studentSnapshot = await studentRef.get();
  final currentagreeState = studentSnapshot.data()?['agreeState'];

  // Increment the agreeState by 1
  final newagreeState = currentagreeState + 1;

  // Update the score on Firebase
  await studentRef.update({'agreeState': newagreeState});

  debugPrint('agreeState updated to $newagreeState');
}
