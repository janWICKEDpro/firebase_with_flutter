import 'package:firebase_app/loading.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggle;
  Register({this.toggle});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth =AuthService();
  bool isLoading = false;
  String email = '';
  String password = '',error = '';
  @override
  Widget build(BuildContext context) {
    return isLoading? Loading():Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[500],
          title: Text("Register to Brew Crew"),
          actions: [
            FlatButton.icon(onPressed: ()=> widget.toggle(), icon: Icon(Icons.account_box), label: Text("Login"))
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
                        icon: Icon(Icons.mail_outline) ,

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
                          icon: Icon(Icons.lock),
                          labelText: "password",
                      ),
                      obscureText: true,
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
                          isLoading =true;
                        });
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result==null){
                        setState(() {
                          isLoading =false;
                          error = 'enter valid email';
                        });
                      }
                      }
                    },
                    child: Text("Register"),
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
