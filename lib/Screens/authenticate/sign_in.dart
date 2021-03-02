
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isObscure = true;
  String email = '';
  String password = '';
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
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                    prefix: Icon(Icons.mail_outline),
                    labelText: "email",

                ),
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  prefix: Icon(Icons.lock),
                  labelText: "password",
                  suffix: FlatButton(
                    child: isObscure? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                    onPressed: (){
                      setState(() {
                        isObscure = !isObscure;
                      });
                    }
                  )
                ),
                obscureText: isObscure,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),

            ],
          ),
        )
      )
    );
  }
}
