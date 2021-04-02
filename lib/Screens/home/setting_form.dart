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
  List<String> sugars = ['0','1','2','3'];

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
            final users =snapshot.data;
            return Form(
              key: _key,
              child: Padding(
               padding: EdgeInsets.all(8.0),
           child:   Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: users.name,
                    validator: (val) => val.length < 6 ? 'beef' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  //Dropdown
                  DropdownButtonFormField(
                    value: _currentSugars ?? users.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar Sugars'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSugars = val),
                  ),
                  //slider
                  Padding(
                    padding: EdgeInsets.all(8.0),
                child: Slider(
                    divisions: 8,
                    value: (_currentStrength ?? users.strength).toDouble(),
                    activeColor: Colors.brown[_currentStrength ?? users.strength],
                    inactiveColor: Colors.brown[_currentStrength ?? users.strength],
                    min: 100,
                    max: 900,
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                  ),
                  ),
                  TextButton(onPressed: () async{
                    if(_key.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(_currentSugars ?? users.sugars, _currentName ?? users.name, _currentStrength ?? users.strength);
                      Navigator.pop(context);
                      print(_currentStrength);
                    }
                  },
                    child: Text(
                        "Update"
                    ),

                  )
                ],
              ),
              )
            );
          }else{
          return  Loading();
          }
    }
    );
  }
}
