// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future swap(String userData) async {
  // swap 2 int numbers and update them in firebase
// Assuming userData is a string containing the user's data in Firebase

  // Get the user's data from Firebase
  final userRef =
      FirebaseFirestore.instance.collection('MedlinkStudentsDB').doc(userData);
  final userDataSnapshot = await userRef.get();
  final userDataMap = userDataSnapshot.data();

  // Get the two numbers to swap
  int num1 = userDataMap!['matKey'];
  int num2 = userDataMap['optionMat'];

  // Swap the numbers
  int temp = num1;
  num1 = num2;
  num2 = temp;

  // Update the numbers in Firebase
  await userRef.update({
    'matKey': num1,
    'optionMat': num2,
  });
}
