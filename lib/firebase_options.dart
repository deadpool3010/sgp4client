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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCd-xQUIR6aXp6oxVF-ywAcJ9egeO90kro',
    appId: '1:247647765960:web:46ddc56dc39af3f2a06cfd',
    messagingSenderId: '247647765960',
    projectId: 'mail-b8362',
    authDomain: 'mail-b8362.firebaseapp.com',
    storageBucket: 'mail-b8362.appspot.com',
    measurementId: 'G-97DLB1L3C0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkkkW_V18K9KjDARsPW80H-PiyBA3TjBM',
    appId: '1:247647765960:android:df6b83401133d94da06cfd',
    messagingSenderId: '247647765960',
    projectId: 'mail-b8362',
    storageBucket: 'mail-b8362.appspot.com',
  );
}
