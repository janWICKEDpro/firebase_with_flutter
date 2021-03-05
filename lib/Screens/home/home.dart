import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:firebase_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
 final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().brews,
      child:Scaffold(
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
        body: BrewList(),
    )
    );
  }
}
