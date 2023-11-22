// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future signedUser(String userData, String userCollectionData) async {
  // read and store signed user document and collection

// Get current user
  final user = FirebaseAuth.instance.currentUser;

// Create a reference to the signed user document
  final userDocRef =
      FirebaseFirestore.instance.collection('users').doc(user?.uid);

// Read the signed user document
  final userDocSnapshot = await userDocRef.get();

// Check if the document exists
  if (userDocSnapshot.exists) {
    // Store the document data in a Map
    final userData = userDocSnapshot.data();

    // Create a reference to the signed user collection
    final userCollectionRef = userDocRef.collection('signed');

    // Read the signed user collection
    final userCollectionSnapshot = await userCollectionRef.get();

    // Check if the collection exists
    if (userCollectionSnapshot.docs.isNotEmpty) {
      // Store the collection data in a List
      final userCollectionData =
          userCollectionSnapshot.docs.map((doc) => doc.data()).toList();

      // Return the user data and collection data
      return {'userData': userData, 'userCollectionData': userCollectionData};
    } else {
      // Return only the user data
      return {'userData': userData};
    }
  }
  String userData = 'userData';
  String userCollectionData = 'userCollectionData';
  final arguments = {
    'userData': userData,
    'userCollectionData': userCollectionData,
  };
  return arguments;
}
