import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBOQQpeNr8zS65HI3pT-ZIhmLzsL8yOkrI",
            authDomain: "guessthesong-bcbaf.firebaseapp.com",
            projectId: "guessthesong-bcbaf",
            storageBucket: "guessthesong-bcbaf.appspot.com",
            messagingSenderId: "216126814847",
            appId: "1:216126814847:web:4ee0b9fac7425020901d4a",
            measurementId: "G-WYZHMER1GR"));
  } else {
    await Firebase.initializeApp();
  }
}
