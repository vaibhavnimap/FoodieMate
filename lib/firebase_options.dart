// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCZ-xoGYntK1LSDKwlzOZzltIc6M_Q_nRE',
    appId: '1:740095071539:web:3773bb00a376ba93195a46',
    messagingSenderId: '740095071539',
    projectId: 'fir-demo1-39c3e',
    authDomain: 'fir-demo1-39c3e.firebaseapp.com',
    storageBucket: 'fir-demo1-39c3e.appspot.com',
    measurementId: 'G-EY053WQYEP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdL98tPFxD7E3cMjxUDUEAjrigmX1JH9Q',
    appId: '1:740095071539:android:dd4ef5457f53b098195a46',
    messagingSenderId: '740095071539',
    projectId: 'fir-demo1-39c3e',
    storageBucket: 'fir-demo1-39c3e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWLH76ec4euev2CKZsrQsxQm5INvPIvPU',
    appId: '1:740095071539:ios:db9b93782f94923c195a46',
    messagingSenderId: '740095071539',
    projectId: 'fir-demo1-39c3e',
    storageBucket: 'fir-demo1-39c3e.appspot.com',
    iosBundleId: 'com.example.foodiemate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWLH76ec4euev2CKZsrQsxQm5INvPIvPU',
    appId: '1:740095071539:ios:db9b93782f94923c195a46',
    messagingSenderId: '740095071539',
    projectId: 'fir-demo1-39c3e',
    storageBucket: 'fir-demo1-39c3e.appspot.com',
    iosBundleId: 'com.example.foodiemate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCZ-xoGYntK1LSDKwlzOZzltIc6M_Q_nRE',
    appId: '1:740095071539:web:1ae70d8a6024119f195a46',
    messagingSenderId: '740095071539',
    projectId: 'fir-demo1-39c3e',
    authDomain: 'fir-demo1-39c3e.firebaseapp.com',
    storageBucket: 'fir-demo1-39c3e.appspot.com',
    measurementId: 'G-ELSSENFYQ6',
  );
}
