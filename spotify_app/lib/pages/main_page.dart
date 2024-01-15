import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/app.dart';
import 'package:spotify_app/auth.dart';
import 'package:spotify_app/main.dart';
import 'package:spotify_app/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {

  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
    if(snapshot.hasData){
      return app();
    }
    else{
       return auth();
    }

    });
  }
}