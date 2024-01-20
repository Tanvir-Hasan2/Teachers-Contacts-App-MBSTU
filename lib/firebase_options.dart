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
    apiKey: 'AIzaSyBj78YJ2kuYsfPEM7xKAA3KNOoi0kToOaI',
    appId: '1:1012551442555:web:f8005c3bfc49bdb28b42de',
    messagingSenderId: '1012551442555',
    projectId: 'contacts-app-783a6',
    authDomain: 'contacts-app-783a6.firebaseapp.com',
    storageBucket: 'contacts-app-783a6.appspot.com',
    measurementId: 'G-D5K6VWN2JK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLQ76nvhvuAgVBuqonec0_TkAo28pyjZg',
    appId: '1:1012551442555:android:e66cd5ac9db979468b42de',
    messagingSenderId: '1012551442555',
    projectId: 'contacts-app-783a6',
    storageBucket: 'contacts-app-783a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQS2MiWoQvEFxY2xS7JtEc5eC43mYzi5Y',
    appId: '1:1012551442555:ios:fdb59499701819578b42de',
    messagingSenderId: '1012551442555',
    projectId: 'contacts-app-783a6',
    storageBucket: 'contacts-app-783a6.appspot.com',
    iosBundleId: 'com.example.teachersContactBookMbstu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQS2MiWoQvEFxY2xS7JtEc5eC43mYzi5Y',
    appId: '1:1012551442555:ios:e7ce237e42c69e928b42de',
    messagingSenderId: '1012551442555',
    projectId: 'contacts-app-783a6',
    storageBucket: 'contacts-app-783a6.appspot.com',
    iosBundleId: 'com.example.teachersContactBookMbstu.RunnerTests',
  );
}
