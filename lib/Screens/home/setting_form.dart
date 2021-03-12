import 'package:firebase_app/loading.dart';
import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settingss extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settingss> {
  final _key = GlobalKey<FormState>();
  List<String> sugars = ['0','1''2','3'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return StreamBuilder(
        stream: DatabaseService(uid:user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final user =snapshot.data;
            return Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: user.name,
                    validator: (val) => val.length < 6 ? 'beef' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  //Dropdown
                  DropdownButtonFormField(
                    value: _currentSugars ?? user.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar Sugars'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSugars = val),
                  ),
                  //slider
                  Slider(
                    value: (_currentStrength ?? user.strength).toDouble(),
                    activeColor: Colors.brown[_currentStrength ?? user.strength],
                    inactiveColor: Colors.brown[_currentStrength ?? user.strength],
                    min: 100,
                    max: 900,
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                  ),
                  RaisedButton(onPressed: () async{
                    if(_key.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(_currentSugars ?? user.sugars, _currentName ?? user.name, _currentStrength ?? user.strength);
                    }
                    Navigator.pop(context);
                  },
                    child: Text(
                        "Submit"
                    ),
                    color: Colors.pink,
                  )
                ],
              ),
            );
          }else{
          return  Loading();
          }
    }
    );
  }
}
