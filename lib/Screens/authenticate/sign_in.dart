
import 'package:firebase_app/loading.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn({@required this.toggle});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isObscure = true, isLoading = false;
  String email = '';
  String password = '';
  String error = '';
final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return isLoading? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text("Sign in to Brew Crew"),
        actions: [
          FlatButton.icon(onPressed: ()=> widget.toggle(),icon: Icon(Icons.account_box), label: Text("Register"))
        ],
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (val)=> val.isEmpty?'Enter a valid email':null,
                decoration: InputDecoration(
                    labelText: "email",
                ),
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
    ),
              SizedBox(height: 20,),
              Padding(
              padding: EdgeInsets.all(8.0),
             child: TextFormField(
               validator: (val) => val.length <6 ? 'Enter a password 6 characters long': null,
                decoration: InputDecoration(
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
    ),

    RaisedButton(
    onPressed: () async{
    if(_formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      dynamic res = await _authService.signInWithEmailAndPassword(email, password);
      if(res==null){
          setState(() {
            isLoading=false;
            error= 'Could not sign In with those credentials';
          });
      }
    }
    },
     child: Text("Sign In"),
    color: Colors.pink,
    ),
              SizedBox(height: 10,),
              Text(error,style: TextStyle(color: Colors.red),)

            ],
          ),
        )
      )
    );
  }
}
