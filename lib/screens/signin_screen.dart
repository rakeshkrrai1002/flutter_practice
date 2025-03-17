import 'package:flutter/material.dart';
import 'package:qwerty/screens/home_screen.dart';
import 'package:qwerty/screens/signup_screen.dart';
import 'package:qwerty/utils/color_utils.dart';
import '../reuseable_widgets/reuseable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';



class singinScreen extends StatefulWidget {
  const singinScreen({super.key});

  @override
  State<singinScreen> createState() => _singinScreenState();
}

class _singinScreenState extends State<singinScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: <Widget>[logoWidget("assets/images/leader.png"),
              SizedBox(
                height: 30,
              ),
              reuseableTextField("Enter Username", Icons.person_outline, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reuseableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(email:_emailTextController.text, password: _passwordTextController.text).then((value) {

                    print("Login successfull");
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));

                  }).onError((error,stacTrace){
                    print("Error: ${error.toString()}");
                  });
                      
                  
                }),
                signUpOption()
            ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have account?"),
        GestureDetector(
          onTap:(){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>SignupScreen()));
          },
          child: const Text(
            "sign up",
            style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),

    ),
        )
      ],
    );
  }

}

