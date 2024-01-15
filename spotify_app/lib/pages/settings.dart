import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          Color.fromARGB(255, 94, 168, 225),
          Color(0xff09203f),
          Color(0xff09203f),
          Color(0xff09203f)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                      
                ),
                child: Text(
                 "Log out",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white), 
                ),
              ),
            ),
          )


          ]

          
          
        ),
      ),
    );
  }
}