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
    apiKey: 'AIzaSyAh_jecN-zLNjhWEGZoi4PCVaJrEoRQT-E',
    appId: '1:449895299112:web:48667992b84b8e9bd51d1d',
    messagingSenderId: '449895299112',
    projectId: 'sophie-messengerapp',
    authDomain: 'sophie-messengerapp.firebaseapp.com',
    storageBucket: 'sophie-messengerapp.appspot.com',
    measurementId: 'G-TLC6YY5VRG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqLYaqPja3fR2gFRV5AAYrxsst_OtGNY0',
    appId: '1:449895299112:android:2b0bd3df811e0c80d51d1d',
    messagingSenderId: '449895299112',
    projectId: 'sophie-messengerapp',
    storageBucket: 'sophie-messengerapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNSZM80t9W0vNXU8K_4_rmx4rc01XaaB4',
    appId: '1:449895299112:ios:fe65d2ccbe01411cd51d1d',
    messagingSenderId: '449895299112',
    projectId: 'sophie-messengerapp',
    storageBucket: 'sophie-messengerapp.appspot.com',
    iosBundleId: 'com.example.sophieMessengerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNSZM80t9W0vNXU8K_4_rmx4rc01XaaB4',
    appId: '1:449895299112:ios:fe65d2ccbe01411cd51d1d',
    messagingSenderId: '449895299112',
    projectId: 'sophie-messengerapp',
    storageBucket: 'sophie-messengerapp.appspot.com',
    iosBundleId: 'com.example.sophieMessengerApp',
  );
}