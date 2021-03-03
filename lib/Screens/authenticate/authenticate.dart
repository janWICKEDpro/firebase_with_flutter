import 'package:firebase_app/Screens/authenticate/Register.dart';
import 'package:firebase_app/Screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return showSignIn ? SignIn(toggle: toggleView,) : Register(toggle: toggleView,);
  }
}

