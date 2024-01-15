import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
   final  VoidCallback showloginpage;
  const signIn({super.key,required this.showloginpage});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {

Future  signUp()async{
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim());
}
  
final _emailcontroller=TextEditingController();
final  _passwordcontroller=TextEditingController();

void dispose(){
  _emailcontroller.dispose();
  _passwordcontroller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
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
                    Icon(
                      Icons.music_note,
                      size: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.5,
                    ),
                    Text(
                      "begin your music journey",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: _emailcontroller,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "E-Mail"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: _passwordcontroller,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Password"),
                            obscureText: true,
                          ),
                        ),
                      ),
                    ),
                   
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: signUp,
                      child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Sign In ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    ),
                     Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already A member??",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15,),),
                    GestureDetector
                    
                  (onTap:widget.showloginpage ,
                    child: Text(" Login ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15,),)),
                 
                  ],
                 ),
               )
               
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
