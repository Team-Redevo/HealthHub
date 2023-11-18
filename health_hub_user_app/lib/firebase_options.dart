// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAa5yr3GHa5KlhsnJJ6QavwNcjnY_UEnSs',
    appId: '1:1086792029628:web:aaa2de895fbf596aa807b9',
    messagingSenderId: '1086792029628',
    projectId: 'health-hub-dea1e',
    authDomain: 'health-hub-dea1e.firebaseapp.com',
    storageBucket: 'health-hub-dea1e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOzA2JnldHkpUkb2oUTqLkuBG_zIva5AU',
    appId: '1:1086792029628:android:dfff0c0cf86f25a1a807b9',
    messagingSenderId: '1086792029628',
    projectId: 'health-hub-dea1e',
    storageBucket: 'health-hub-dea1e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZXBWRshiEY5FxOcuesoXmrlRb6gDx--E',
    appId: '1:1086792029628:ios:ae4c0c5822daa93ba807b9',
    messagingSenderId: '1086792029628',
    projectId: 'health-hub-dea1e',
    storageBucket: 'health-hub-dea1e.appspot.com',
    iosBundleId: 'com.example.healthHubUserApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZXBWRshiEY5FxOcuesoXmrlRb6gDx--E',
    appId: '1:1086792029628:ios:220bcb827dc2a57ba807b9',
    messagingSenderId: '1086792029628',
    projectId: 'health-hub-dea1e',
    storageBucket: 'health-hub-dea1e.appspot.com',
    iosBundleId: 'com.example.healthHubUserApp.RunnerTests',
  );
}