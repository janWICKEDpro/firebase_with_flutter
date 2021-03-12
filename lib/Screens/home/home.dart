import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/brew.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:firebase_app/services/database.dart';
import 'setting_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
 final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showbottom() {
      showModalBottomSheet(context: context, builder: (context){
        return Settingss();
      });
    }
    return StreamProvider<List<Brew>>.value(
      initialData: [],
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
          ),
          TextButton.icon(onPressed: ()=> _showbottom(), icon: Icon(Icons.settings), label: Text("settings"))
        ],
      ),
        body: BrewList(),
    )
    );
  }
}
