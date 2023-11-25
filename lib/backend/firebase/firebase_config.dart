import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCXTKAIaPcuyArl6_ddzrPZHp7rRuGjzpM",
            authDomain: "login-app-3417e.firebaseapp.com",
            projectId: "login-app-3417e",
            storageBucket: "login-app-3417e.appspot.com",
            messagingSenderId: "666486131748",
            appId: "1:666486131748:web:570e701382580b7dcfdcb1",
            measurementId: "G-140HSE3T8B"));
  } else {
    await Firebase.initializeApp();
  }
}
