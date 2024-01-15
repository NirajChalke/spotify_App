

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginpage extends StatefulWidget {
  final  VoidCallback showsignInpage;
  const loginpage({super.key,required this.showsignInpage});
   
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {


final _emailcontroller=TextEditingController();
final  _passwordcontroller=TextEditingController();

Future signIn() async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim());
}



void dispose(){
  _emailcontroller.dispose();
  _passwordcontroller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home:Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          Color.fromARGB(255, 94, 168, 225),
          Color(0xff09203f),
          Color(0xff09203f),
          Color(0xff09203f)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                  
                Icon(Icons.lock,size: 100,),
               Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("Welcome Back!!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.blueGrey),),
               ),
               SizedBox(height: 0.5,),
               Text("you have been missed",style: TextStyle(fontSize: 24,color: Colors.blueGrey),) ,
               
               SizedBox(height: 30,),
               Padding(
             padding: const EdgeInsets.only(left: 25,right: 25),
             child: Container(
                
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blueGrey),
               child: Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "E-Mail"),
                  
                 ),
               ),
             ),
               ),
               SizedBox(height: 8,),
               Padding(
             padding: const EdgeInsets.only(left: 25,right: 25),
             child: Container(
                
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blueGrey),
               child: Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: TextField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "Password"),
                  obscureText: true,
                  
                 ),
               ),
             ),
               ),
               SizedBox(height: 25,),
               GestureDetector(
                 onTap: () {
                   signIn();
                 },
                 child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),),
                  child:Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                   
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to App??",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15,),),
                    GestureDetector
                    
                  (onTap:widget.showsignInpage ,
                    child: Text(" Sign in",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15,),)),
                 
                  ],
                 ),
               )
               
                
                
               ],
                
              ),
          ),
        ),
      ),
    )


    );
  }
}