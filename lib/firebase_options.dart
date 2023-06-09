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
    apiKey: 'AIzaSyDOaf4OtChT6WltdJS3gj9iI7zz76f2Ar4',
    appId: '1:887901712407:web:023316dc161dcaf74fac52',
    messagingSenderId: '887901712407',
    projectId: 'focus-e5180',
    authDomain: 'focus-e5180.firebaseapp.com',
    databaseURL: 'https://focus-e5180-default-rtdb.firebaseio.com',
    storageBucket: 'focus-e5180.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJbjONkoO37DHBGiN8tfH27dIptvncEds',
    appId: '1:887901712407:android:bc2689d8a8d951084fac52',
    messagingSenderId: '887901712407',
    projectId: 'focus-e5180',
    databaseURL: 'https://focus-e5180-default-rtdb.firebaseio.com',
    storageBucket: 'focus-e5180.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrii8lH-vTyxVun2GQjSXJlOUdDV4-uEo',
    appId: '1:887901712407:ios:0f4a9d6a56688b264fac52',
    messagingSenderId: '887901712407',
    projectId: 'focus-e5180',
    databaseURL: 'https://focus-e5180-default-rtdb.firebaseio.com',
    storageBucket: 'focus-e5180.appspot.com',
    iosClientId:
        '887901712407-45kckg8ek4546j0rcc3s449dkigt6486.apps.googleusercontent.com',
    iosBundleId: 'com.example.front',
  );
}
