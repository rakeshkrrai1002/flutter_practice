import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../reuseable_widgets/reuseable_widgets.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:const Text( 
          "Sign up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
          padding: EdgeInsets.fromLTRB(
          20,
          MediaQuery.of(context).size.height * 0.2,
          20,
          0,
        ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reuseableTextField("Enter Username", Icons.person_outline, false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reuseableTextField("Enter email", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reuseableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email:_emailTextController.text,password:_passwordTextController.text).then((value){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen()));

                  }).onError((error, stackTrace){
                    print("Error ${error.toString()}");
                  });
                })

              ],
            ),
        )
        ),
      )
    );
  }
}
