import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LfM538nAAAAAGQMkxMMsOTA0eeD5vkhOUHXWKSd',
      androidProvider: AndroidProvider.playIntegrity,
    );
