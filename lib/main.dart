import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'presentation/core/app.dart';

void main() async {
  // Firebase.initializeApp() needs to call native code to initialize Firebase,
  // and since the plugin needs to use platform channels to call the native code,
  // which is done asynchronously therefore you have to call ensureInitialized()
  // to make sure that you have an instance of the WidgetsBinding.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}
