// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updatesFailed(String userData, String userCollectionData) async {
  // Increment score +10 and update it on firebase
// Assuming you have already initialized Firebase and have a reference to the student's document in Firestore

  final studentRef =
      FirebaseFirestore.instance.collection('MedlinkStudentsDB').doc(userData);

  // Get the current score
  final studentSnapshot = await studentRef.get();
  final currentFailed = studentSnapshot.data()?['FailedTest'];
  final currentTotal = studentSnapshot.data()?['total'];
  final currentScore = studentSnapshot.data()?['score'];
  final currentIndex = studentSnapshot.data()?['index'];

  // Increment the score by 10 and total 1
  final newFailed = currentFailed + 1;
  final newTotal = currentTotal + 1;
  final newScore = currentScore - currentScore;
  final newIndex = (currentIndex - currentIndex) + 1;

  // Update the score on Firebase
  await studentRef.update({'FailedTest': newFailed});
  await studentRef.update({'total': newTotal});
  await studentRef.update({'score': newScore});
  await studentRef.update({'index': newIndex});

  print('FailedTest updated to $newFailed');
  print('total updated to $newTotal');
  print('score updated to $newScore');
}
