
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text("Sign in to Brew Crew"),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('Sign in anonymous'),
          onPressed: () async{
            dynamic res = await _authService.signInAnon();
            if(res == null){
              print("error");
            }else{
              print("sign");
            }
          },
        ),
    ),
    );
  }
}
