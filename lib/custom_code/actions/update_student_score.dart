// Automatic FlutterFlow imports
import 'package:flutter/material.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updateStudentScore(String userData, String userCollectionData) async {
  // Increment score +10 and update it on firebase
// Assuming you have already initialized Firebase and have a reference to the student's document in Firestore

  final studentRef =
      FirebaseFirestore.instance.collection('MedlinkStudentsDB').doc(userData);

  // Get the current score
  final studentSnapshot = await studentRef.get();
  final currentScore = studentSnapshot.data()?['score'];

  // Increment the score by 10
  final newScore = currentScore + 10;

  // Update the score on Firebase
  await studentRef.update({'score': newScore});
  debugPrint('score updated to $newScore');
}
