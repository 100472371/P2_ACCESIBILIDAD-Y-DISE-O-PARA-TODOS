import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA_YUNQBjWsaSSzGSTmHFa1K9WKQ_YqA-k",
            authDomain: "accesibilidad-y-disenyo.firebaseapp.com",
            projectId: "accesibilidad-y-disenyo",
            storageBucket: "accesibilidad-y-disenyo.firebasestorage.app",
            messagingSenderId: "377306654590",
            appId: "1:377306654590:web:c330510a0651a5215e352f"));
  } else {
    await Firebase.initializeApp();
  }
}
