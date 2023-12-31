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
    apiKey: 'AIzaSyBvcYkfnCJ9sFBCy3OlBPr44JUfb2o127Q',
    appId: '1:288693927005:web:0ddbeaba6e7727a668e1b4',
    messagingSenderId: '288693927005',
    projectId: 'to-do-app-91271',
    authDomain: 'to-do-app-91271.firebaseapp.com',
    storageBucket: 'to-do-app-91271.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhZKkCWVf7K_EEQBMW_bTdEt4YVWC0Pg8',
    appId: '1:288693927005:android:36e235385f8f591868e1b4',
    messagingSenderId: '288693927005',
    projectId: 'to-do-app-91271',
    storageBucket: 'to-do-app-91271.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1GbWAxjwuKGdaxjMDpBDqkVH2nG2IPk0',
    appId: '1:288693927005:ios:2fdc92ac9cae7a9e68e1b4',
    messagingSenderId: '288693927005',
    projectId: 'to-do-app-91271',
    storageBucket: 'to-do-app-91271.appspot.com',
    iosBundleId: 'com.example.htodo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1GbWAxjwuKGdaxjMDpBDqkVH2nG2IPk0',
    appId: '1:288693927005:ios:98a607f2d25e10b668e1b4',
    messagingSenderId: '288693927005',
    projectId: 'to-do-app-91271',
    storageBucket: 'to-do-app-91271.appspot.com',
    iosBundleId: 'com.example.htodo.RunnerTests',
  );
}
