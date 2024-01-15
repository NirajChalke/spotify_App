

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/app.dart';
import 'package:spotify_app/pages/Signin.dart';
import 'package:spotify_app/pages/main_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAiMZWlfGYIa1bGZDKqHedKvDejbf4RCgI",
      appId: "1:577355563132:android:deb9599e8440247abe89f9",
      messagingSenderId: "577355563132",
      projectId: "songsapp-f80f3",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return main_page();
  }
}
