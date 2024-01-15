import 'package:flutter/material.dart';
import 'package:spotify_app/pages/Signin.dart';
import 'package:spotify_app/pages/login.dart';

class auth extends StatefulWidget {
  const auth({super.key});

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {

bool showLoginpage=true;
void togglescreen(){
  setState(() {
    showLoginpage=!showLoginpage;
  });

}

  @override
  Widget build(BuildContext context) {
       
   if(showLoginpage){
    return loginpage(showsignInpage: togglescreen);

   }
   else{
    return signIn(showloginpage: togglescreen);
   }


  }
}