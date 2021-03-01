import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Brew Crew"),
        backgroundColor: Colors.brown[400],
        actions: [
          FlatButton.icon(onPressed: () async{
            await _auth.SignOut();
          },
              icon: Icon(Icons.account_box),
              label: Text("logout")
          )
        ],
      ),
    );
  }
}
