import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggle;
  Register({this.toggle});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth =AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[500],
          title: Text("Sign in to Brew Crew"),
          actions: [
            FlatButton.icon(onPressed: (){
              widget.toggle;
            }, icon: Icon(Icons.account_box), label: Text("Login"))
          ],
        ),
        body: Container(
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.all(8.0),
                    child: TextFormField(
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
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
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
                  ),

                  RaisedButton(
                    onPressed: (){},
                    child: Text("Get In"),
                    color: Colors.pink,
                  )

                ],
              ),
            )
        )
    );
  }
}
