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
    apiKey: 'AIzaSyAu0lPSgSs5O5iUD1bFHOQ6yQJKPqj0PfE',
    appId: '1:930860832295:web:ce9a075057a12c3b982002',
    messagingSenderId: '930860832295',
    projectId: 'cart-app-3fbe5',
    authDomain: 'cart-app-3fbe5.firebaseapp.com',
    storageBucket: 'cart-app-3fbe5.appspot.com',
    measurementId: 'G-MM6T3H97Q3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCL_mdllSvJ_Qbs2JoaZ_-u0cExNJyztkg',
    appId: '1:930860832295:android:a1ef991064e940f0982002',
    messagingSenderId: '930860832295',
    projectId: 'cart-app-3fbe5',
    storageBucket: 'cart-app-3fbe5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnrCgVnd_NX_QLsGndPNGJ6kRmWSo6COY',
    appId: '1:930860832295:ios:6b27604fdfb56d10982002',
    messagingSenderId: '930860832295',
    projectId: 'cart-app-3fbe5',
    storageBucket: 'cart-app-3fbe5.appspot.com',
    iosBundleId: 'com.example.taskDSakshi2453',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnrCgVnd_NX_QLsGndPNGJ6kRmWSo6COY',
    appId: '1:930860832295:ios:0a980062630cc5da982002',
    messagingSenderId: '930860832295',
    projectId: 'cart-app-3fbe5',
    storageBucket: 'cart-app-3fbe5.appspot.com',
    iosBundleId: 'com.example.taskDSakshi2453.RunnerTests',
  );
}
