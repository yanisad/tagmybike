import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDKgxlPzJinxuC1l5JGChzr18RYyEdgp54",
            authDomain: "tagmybike-3684e.firebaseapp.com",
            projectId: "tagmybike-3684e",
            storageBucket: "tagmybike-3684e.appspot.com",
            messagingSenderId: "306559191851",
            appId: "1:306559191851:web:27c8d91df3fe2a48df936e",
            measurementId: "G-DYQVV6JRWJ"));
  } else {
    await Firebase.initializeApp();
  }
}
