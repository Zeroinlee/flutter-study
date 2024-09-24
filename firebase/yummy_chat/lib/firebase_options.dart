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
    apiKey: 'AIzaSyDi6QOpcbAYiKbckO1zK_pkX47yr1i8V8Y',
    appId: '1:981054163920:web:06e68144d5b2cc03fcc7d5',
    messagingSenderId: '981054163920',
    projectId: 'login-758de',
    authDomain: 'login-758de.firebaseapp.com',
    storageBucket: 'login-758de.appspot.com',
    measurementId: 'G-12EVZNJF9N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYxSB2KesDsIwK_HlIHlaoPCeHihlRIn0',
    appId: '1:981054163920:android:7d0fb0b7ab9011a1fcc7d5',
    messagingSenderId: '981054163920',
    projectId: 'login-758de',
    storageBucket: 'login-758de.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtyaCaxYZSjzu-RbRJSXcUpAHnrVYq0z0',
    appId: '1:981054163920:ios:29030cc32b9e1d30fcc7d5',
    messagingSenderId: '981054163920',
    projectId: 'login-758de',
    storageBucket: 'login-758de.appspot.com',
    androidClientId: '981054163920-lv19gmesj9hul6aq7q97ir66d7977p20.apps.googleusercontent.com',
    iosClientId: '981054163920-3nb442cnkmo06pm81lg60au4c4t52fb2.apps.googleusercontent.com',
    iosBundleId: 'com.example.yummyChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtyaCaxYZSjzu-RbRJSXcUpAHnrVYq0z0',
    appId: '1:981054163920:ios:29030cc32b9e1d30fcc7d5',
    messagingSenderId: '981054163920',
    projectId: 'login-758de',
    storageBucket: 'login-758de.appspot.com',
    androidClientId: '981054163920-lv19gmesj9hul6aq7q97ir66d7977p20.apps.googleusercontent.com',
    iosClientId: '981054163920-3nb442cnkmo06pm81lg60au4c4t52fb2.apps.googleusercontent.com',
    iosBundleId: 'com.example.yummyChat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDi6QOpcbAYiKbckO1zK_pkX47yr1i8V8Y',
    appId: '1:981054163920:web:c41230f0e1a2c10cfcc7d5',
    messagingSenderId: '981054163920',
    projectId: 'login-758de',
    authDomain: 'login-758de.firebaseapp.com',
    storageBucket: 'login-758de.appspot.com',
    measurementId: 'G-TQ8KNJV573',
  );
}
